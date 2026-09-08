# Check That Every Variable Passed to count_selections Is a Select Multiple

Counting how many choices a respondent picked is meaningless for a
single select, so this fails loudly rather than silently returning a
column of ones.

## Usage

``` r
ck_check_count_selections(
  count_selections,
  dataset,
  loa = NULL,
  sm_separator = "/"
)
```

## Arguments

- count_selections:

  Character vector of variable names to check.

- dataset:

  The dataset (used for the child columns).

- loa:

  The list of analyses (used for declared types).

- sm_separator:

  Separator between parent and choice. Default `"/"`.

## Value

The validated variable names, invisibly. Errors otherwise.
