# Setup Script for Package Development
# Automates updating dependencies in DESCRIPTION, documenting, and checking the package.

# 1. Amend DESCRIPTION with dependencies found in R files
if (requireNamespace("attachment", quietly = TRUE)) {
  message("--> Amending DESCRIPTION with attachment::att_amend_desc()...")
  attachment::att_amend_desc()
} else {
  warning("Package 'attachment' is not installed. Skipping DESCRIPTION amendment.")
}

# 1b. Put the optional dependencies back in Suggests.
#
# attachment files every `::`-referenced package under Imports, and three of
# ours are referenced that way in R/analysis_pipeline.R while having to stay
# optional:
#
#   * analysistools and cleaningtools are GitHub-only, not on CRAN. In Imports
#     they become hard install requirements, so remotes::install_github() of
#     this package fails for anyone who does not already have them, and
#     R CMD check errors on the missing dependencies.
#   * srvyr, analysistools and cleaningtools are each reached by one feature
#     only: the survey engine (an `analysis` row with a `level` set) and
#     recreate_sm_parents. Every run that leaves `level` empty uses the fast
#     tabulation engine and needs none of them.
#
# dev/config_attachment.yaml lists them under extra.suggests, but that only
# ADDS to Suggests - it does not demote a package that `::` detection has
# already put in Imports (verified: it does not). So the curated split is
# restored here, after the fact and deterministically.
optional_deps <- c("srvyr", "analysistools", "cleaningtools")

if (requireNamespace("desc", quietly = TRUE)) {
  d <- desc::desc(file = "DESCRIPTION")
  deps <- d$get_deps()
  misfiled <- intersect(optional_deps, deps$package[deps$type == "Imports"])

  if (length(misfiled) > 0) {
    message(
      "--> Moving optional dependencies back to Suggests: ",
      paste(misfiled, collapse = ", ")
    )
    for (p in misfiled) d$del_dep(p, type = "Imports")
    for (p in misfiled) d$set_dep(p, type = "Suggests")
    d$normalize()
    d$write()
  }
} else {
  warning(
    "Package 'desc' is not installed, so the Imports/Suggests split was not ",
    "enforced. Check by hand that srvyr, analysistools and cleaningtools are ",
    "under Suggests and not Imports."
  )
}

# 2. Document the package (updates NAMESPACE and Rd files)
if (requireNamespace("devtools", quietly = TRUE)) {
  message("--> Documenting package with devtools::document()...")
  devtools::document()
} else {
  stop("Package 'devtools' is required but not installed.")
}

# 3. Check the package
if (requireNamespace("devtools", quietly = TRUE)) {
  message("--> Checking package with devtools::check(vignettes = FALSE)...")
  # Vignettes are skipped by default to avoid Pandoc path issues outside RStudio
  devtools::check(vignettes = FALSE, error_on = "error")
}
