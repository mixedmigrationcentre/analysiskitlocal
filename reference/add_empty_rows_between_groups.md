# Insert Empty Rows Between Grouped Elements

Inserts an all-`NA` row between groups so each group is visually
separated in the Excel output. Rows within each group can be sorted by
the first `stat_` column, largest first.

## Usage

``` r
add_empty_rows_between_groups(df, col, sort_desc = TRUE)
```

## Arguments

- df:

  The data frame.

- col:

  The column used to identify groups.

- sort_desc:

  Logical. Sort within each group. Default `TRUE`.

## Value

The data frame with empty rows separating distinct groups.
