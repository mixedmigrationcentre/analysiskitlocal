# Drop Group Levels With Too Few Observations

A 200-town disaggregation usually contains towns with a handful of
interviews. Those estimates are not reportable, and they are also what
makes the run slow. Setting them to `NA` removes the column from the
output.

## Usage

``` r
ck_drop_small_groups(
  dataset,
  group_variables,
  min_group_n = NULL,
  verbose = TRUE
)
```

## Arguments

- dataset:

  The analysis dataset.

- group_variables:

  Character vector of grouping variables.

- min_group_n:

  Minimum observations a level must have. `NULL` (default) keeps
  everything.

- verbose:

  Logical. Default `TRUE`.

## Value

A list with `dataset` and `dropped`.
