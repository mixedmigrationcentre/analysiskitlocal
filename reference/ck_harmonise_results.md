# Force the Column Types of a Results Table

When a run uses both engines their outputs are stacked. A column that is
character in one and a factor or double in the other makes
[`dplyr::bind_rows()`](https://dplyr.tidyverse.org/reference/bind_rows.html)
fail with a type error that says nothing useful, so the key columns are
pinned to character and the statistics to numeric first.

## Usage

``` r
ck_harmonise_results(x)
```

## Arguments

- x:

  A long results table.

## Value

`x` with predictable column types.
