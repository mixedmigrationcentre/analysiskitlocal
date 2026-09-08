# Columns Actually Needed by an Analysis

A 4Mi export is hundreds of columns wide and `survey::svyby` copies the
whole data frame once per group level. Handing the design only the
columns the analysis touches cut a 200-level disaggregation from 4.64 s
to 2.78 s per three questions in testing.

## Usage

``` r
ck_design_columns(
  dataset,
  loa,
  group_variables = NULL,
  weight_column = NULL,
  strata_column = NULL,
  sm_separator = "/"
)
```

## Arguments

- dataset:

  The analysis dataset.

- loa:

  The stacked LOA.

- group_variables:

  Grouping variables.

- weight_column, strata_column:

  Optional design columns.

- sm_separator:

  Select_multiple separator.

## Value

A character vector of column names to keep.
