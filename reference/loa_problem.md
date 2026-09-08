# Build a Problems Table

Build a Problems Table

## Usage

``` r
loa_problem(sheet, row, severity, message)
```

## Arguments

- sheet:

  Sheet the problem belongs to.

- row:

  Workbook row number (header is row 1), or `NA` for a sheet-level
  problem.

- severity:

  `"error"` or `"warning"`.

- message:

  The message shown to the user.

## Value

A data frame of problems.
