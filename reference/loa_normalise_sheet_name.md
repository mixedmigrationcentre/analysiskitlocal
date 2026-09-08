# Normalise a Sheet Name for Matching

Lower case, trimmed, with spaces and hyphens collapsed to underscores,
so `"Group Analysis"` and `"group-analysis"` both resolve to
`group_analysis`.

## Usage

``` r
loa_normalise_sheet_name(x)
```

## Arguments

- x:

  Character vector of sheet names.

## Value

A character vector.
