# Build a Survey Design with Optional Weights and Strata

Both are optional. With neither, the dataset is used as it is - an
unweighted SRS design where `n_w` equals `n`.

## Usage

``` r
ck_build_survey_design(
  dataset,
  weight_column = NULL,
  strata_column = NULL,
  verbose = TRUE
)
```

## Arguments

- dataset:

  The analysis dataset (label row already removed).

- weight_column:

  Optional weights column name. Default `NULL`.

- strata_column:

  Optional strata column name. Default `NULL`.

- verbose:

  Logical. Default `TRUE`.

## Value

An srvyr `tbl_svy` object.
