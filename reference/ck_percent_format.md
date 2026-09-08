# The Excel Number Format for a Percentage

Percentages are stored as proportions and displayed through Excel's
number format, so the cell keeps its full precision while the sheet
shows a rounded figure. That distinction matters: a column of displayed
whole numbers still sums and averages correctly, which it would not if
the stored values had been truncated on the way in.

## Usage

``` r
ck_percent_format(digits = 0)
```

## Arguments

- digits:

  Number of decimal places, 0 or more.

## Value

An Excel number format string, e.g. `"0%"` or `"0.0%"`.

## Details

Built as a format string rather than using openxlsx's built-in
`"PERCENTAGE"` id, which is fixed at two decimals.
