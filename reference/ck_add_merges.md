# Add Many Merged Ranges at Once

The ranges built by this file never overlap by construction, so they are
appended straight to the worksheet instead of going through
[`openxlsx::mergeCells()`](https://rdrr.io/pkg/openxlsx/man/mergeCells.html)
once each.

## Usage

``` r
ck_add_merges(wb, sheet, refs)
```

## Arguments

- wb:

  An openxlsx workbook.

- sheet:

  Sheet name.

- refs:

  Character vector of ranges, e.g. `c("C2:E2", "I2:K2")`.

## Value

Invisibly `NULL`.
