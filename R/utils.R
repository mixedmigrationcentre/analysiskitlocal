# =============================================================================
# Package roster and dependency bootstrap
# =============================================================================
#
# One list of what this package needs, in ak_package_roster(). Both
# check_analysis_packages() (which reports) and load_packages() (which
# installs) read from it, so the two can never disagree about whether srvyr is
# optional or which GitHub repo analysistools comes from.
# =============================================================================


#' Every Package This One Needs, and Why
#'
#' The single source of truth. `need` is `"required"` (every run uses it, and it
#' is installed with the package) or `"optional"` (one feature needs it). `repo`
#' is the GitHub `org/repo` for the two that are not on CRAN, and `NA`
#' otherwise.
#'
#' @return A data frame with `package`, `need`, `repo` and `purpose`.
#' @keywords internal
ak_package_roster <- function() {
  pkg <- function(package, need, purpose, repo = NA_character_) {
    data.frame(
      package = package, need = need, repo = repo, purpose = purpose,
      stringsAsFactors = FALSE
    )
  }

  rbind(
    pkg("dplyr", "required", "the analysis pipeline"),
    pkg("tidyr", "required", "reshaping results into the wide table"),
    pkg("stringr", "required", "question and choice labels"),
    pkg("readxl", "required", "reading .xlsx datasets and List of Analysis workbooks"),
    pkg("openxlsx", "required", "writing the results workbook"),
    pkg(
      "srvyr", "optional",
      "the survey engine, used only when an analysis row sets a confidence level"
    ),
    pkg(
      "analysistools", "optional",
      "the survey engine, used only when an analysis row sets a confidence level",
      repo = "impact-initiatives/analysistools"
    ),
    pkg(
      "cleaningtools", "optional",
      "rebuilding select_multiple parent columns, when recreate_sm_parents is TRUE",
      repo = "impact-initiatives/cleaningtools"
    ),
    pkg("writexl", "optional", "the test suite only")
  )
}


#' What to Hand an Installer for Each Package
#'
#' A CRAN package installs by name; the two GitHub-only ones install by
#' `org/repo`, which is the spec both \pkg{pak} and \pkg{remotes} understand.
#'
#' @param roster Rows of [ak_package_roster()].
#' @return A character vector of install specs, one per row.
#' @keywords internal
ak_install_specs <- function(roster) {
  ifelse(is.na(roster$repo), roster$package, roster$repo)
}


#' Install a Set of Packages, Best Effort
#'
#' Split out from [load_packages()] for two reasons: it is the only part that
#' touches the network, which keeps it out of the unit tests; and it is the only
#' part that can fail in ways worth reporting individually.
#'
#' Never stops. Whether a failure matters is [load_packages()]'s judgement to
#' make, from what is missing afterwards and whether any of it was required.
#'
#' @param specs Install specs from [ak_install_specs()] — a CRAN name, or an
#'   `org/repo` for the GitHub-only packages.
#' @param upgrade Logical. Let \pkg{pak} upgrade what is already installed.
#' @return `TRUE` if an installer was available and ran, `FALSE` if not,
#'   invisibly.
#' @keywords internal
ak_install_missing <- function(specs, upgrade = FALSE) {
  # pak rather than install.packages(): it resolves the whole set in one pass
  # and takes the two GitHub specs from the same call. It is a bootstrap rather
  # than a dependency of this package, so it is installed on demand.
  if (!requireNamespace("pak", quietly = TRUE)) {
    message("Installing 'pak', which is used to install the rest...")
    try(utils::install.packages("pak"), silent = TRUE)
  }

  if (!requireNamespace("pak", quietly = TRUE)) {
    message(
      "'pak' is not available, so nothing could be installed automatically."
    )
    return(invisible(FALSE))
  }

  # One batched call first, because pak resolves shared dependencies far better
  # that way. If the batch fails - most often because GitHub is unreachable -
  # retry one at a time, so a reachable package still gets installed and the
  # report names exactly which ones did not.
  batched <- tryCatch(
    {
      pak::pkg_install(specs, upgrade = upgrade, ask = FALSE)
      TRUE
    },
    error = function(e) {
      message("Installing them together failed: ", conditionMessage(e))
      message("Retrying one at a time...")
      FALSE
    }
  )

  if (!batched) {
    for (i in seq_along(specs)) {
      tryCatch(
        pak::pkg_install(specs[i], upgrade = upgrade, ask = FALSE),
        error = function(e) {
          message("  could not install ", specs[i], ": ", conditionMessage(e))
        }
      )
    }
  }

  invisible(TRUE)
}


#' Install and Load Everything This Package Needs
#'
#' Installs whatever is missing and, optionally, attaches it. Uses \pkg{pak},
#' which resolves the whole set in one pass and handles the two GitHub-only
#' packages from the same call.
#'
#' @section What it installs:
#'
#' The **required** packages come with the package itself, so on a normal
#' install there is nothing to do — this only matters if the folder was copied
#' rather than installed.
#'
#' The **optional** ones are the point. `srvyr`, `analysistools` and
#' `cleaningtools` are in `Suggests` and are *not* installed with the package,
#' and two of them are not on CRAN at all. Run this once and the survey engine
#' works:
#'
#' ```r
#' load_packages()
#' ```
#'
#' **You do not need them for most runs.** An `analysis` row with a `level` set
#' asks for a confidence interval, which routes that row through `srvyr` and
#' `analysistools`. Leave every `level` cell empty and the fast tabulation
#' engine handles the whole run, needing none of the three — and on a large
#' disaggregation taking seconds rather than minutes. So if `load_packages()`
#' cannot reach GitHub, that is inconvenient rather than fatal.
#'
#' @section Why it does not attach by default:
#'
#' Unlike a folder of scripts, this is a package: every internal call is
#' namespace-qualified (`dplyr::bind_rows()`, `openxlsx::createStyle()`), so
#' nothing needs to be on your search path for the analysis to run. Attaching
#' `dplyr` would also mask `stats::filter()` and `stats::lag()` in your session
#' for no gain. Pass `attach = TRUE` if you want them anyway, for your own
#' interactive work.
#'
#' @param optional Logical. Also install the optional packages — the survey
#'   engine and `cleaningtools`. Default `TRUE`; `FALSE` does the required ones
#'   only, which is the quick offline-safe check.
#' @param attach Logical. Also `library()` the required CRAN packages into your
#'   session. Default `FALSE`; see above.
#' @param upgrade Logical. Let \pkg{pak} upgrade packages that are already
#'   installed. Default `FALSE`, so a working library is not disturbed.
#'
#' @return The status table from [check_analysis_packages()], invisibly, taken
#'   *after* the install so it reflects what actually happened.
#' @seealso [check_analysis_packages()] to look without installing anything.
#' @export
#' @examples
#' \dontrun{
#' # Everything, including the survey engine
#' load_packages()
#'
#' # Required only - no network beyond CRAN, no GitHub
#' load_packages(optional = FALSE)
#'
#' # ...and put dplyr and friends on the search path for your own use
#' load_packages(attach = TRUE)
#' }
load_packages <- function(optional = TRUE,
                          attach = FALSE,
                          upgrade = FALSE) {
  roster <- ak_package_roster()
  if (!isTRUE(optional)) {
    roster <- roster[roster$need == "required", , drop = FALSE]
  }

  is_installed <- function(p) requireNamespace(p, quietly = TRUE)
  missing <- roster[!vapply(roster$package, is_installed, logical(1)), , drop = FALSE]

  if (nrow(missing) == 0) {
    message(
      "All ", nrow(roster), " package(s) this one needs are already installed."
    )
  } else {
    message(
      "Missing ", nrow(missing), " of ", nrow(roster), " package(s): ",
      paste(missing$package, collapse = ", ")
    )

    # Best effort, and deliberately not stopped on. Whether a failure matters
    # depends entirely on whether anything REQUIRED is still missing, which the
    # status report below decides. Stopping here would turn three absent
    # optional packages into a hard failure - exactly what this package's design
    # says they are not.
    ak_install_missing(ak_install_specs(missing), upgrade = upgrade)
  }

  # Report from a fresh look rather than from what was asked for, so the
  # summary is what is actually installed now.
  status <- check_analysis_packages()
  wanted <- status[status$package %in% roster$package, , drop = FALSE]
  still_missing <- wanted[!wanted$installed, , drop = FALSE]

  if (nrow(still_missing) > 0) {
    message(
      "\nStill missing: ",
      paste(still_missing$package, collapse = ", "),
      "\nInstall by hand with:\n  ",
      paste(still_missing$install, collapse = "\n  ")
    )
    fatal <- still_missing$need == "required"
    if (any(fatal)) {
      warning(
        "These are required, so runs will fail until they are installed: ",
        paste(still_missing$package[fatal], collapse = ", "),
        call. = FALSE
      )
    } else {
      message(
        "All of these are optional. Every analysis row that leaves `level` ",
        "empty runs on the fast engine and needs none of them."
      )
    }
  } else {
    message("Ready: every package this one needs is installed.")
  }

  if (isTRUE(attach)) {
    # Only the required CRAN packages. Attaching analysistools or cleaningtools
    # would put nothing useful on the search path.
    to_attach <- roster$package[roster$need == "required"]
    to_attach <- to_attach[vapply(to_attach, is_installed, logical(1))]

    message("Attaching: ", paste(to_attach, collapse = ", "))
    invisible(lapply(to_attach, function(pkg) {
      suppressPackageStartupMessages(
        do.call(library, list(pkg, character.only = TRUE))
      )
    }))
  }

  invisible(status)
}
