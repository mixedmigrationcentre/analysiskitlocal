# Work Out the State of Each Step

The single rule behind the readiness gate, kept separate from anything
that displays it so it can be tested directly.

## Usage

``` r
ak_step_states(
  dataset_loaded = FALSE,
  dataset_failed = FALSE,
  loa_loaded = FALSE,
  loa_failed = FALSE,
  problems = NULL,
  destination_chosen = FALSE,
  destination_failed = FALSE,
  results_ready = FALSE,
  running = FALSE
)
```

## Arguments

- dataset_loaded, dataset_failed:

  State of the dataset read.

- loa_loaded, loa_failed:

  State of the List of Analysis read.

- problems:

  The problems table, or `NULL` when the checks have not run.

- destination_chosen, destination_failed:

  State of the output folder.

- results_ready:

  Logical. Results exist.

- running:

  Logical. An analysis is in progress.

## Value

A named character vector of `"todo"`, `"active"`, `"done"`, `"warning"`
or `"error"`, one per step.
