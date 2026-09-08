# Sheets Ignored Rather Than Rejected

A workbook is allowed to carry its own notes. Anything else unrecognised
is a fatal error: a typo in a sheet name would otherwise be
indistinguishable from a deliberate decision not to configure that
sheet.

## Usage

``` r
loa_is_ignored_sheet(x)
```

## Arguments

- x:

  Normalised sheet names.

## Value

A logical vector.
