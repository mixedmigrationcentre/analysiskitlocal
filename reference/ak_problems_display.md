# Format the Problems Table for Reading

Errors first, then warnings, each group in workbook order. `Where`
collapses the sheet and row into the one string needed to find the cell.

## Usage

``` r
ak_problems_display(problems)
```

## Arguments

- problems:

  A problems data frame, or `NULL`.

## Value

A data frame with `Severity`, `Where` and `What to fix`.
