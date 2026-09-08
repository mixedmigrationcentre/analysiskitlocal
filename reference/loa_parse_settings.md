# Parse and Type-Check the `settings` Sheet

Returns only the settings that were actually supplied, so every unset
argument keeps the pipeline's own default.

## Usage

``` r
loa_parse_settings(sheet)
```

## Arguments

- sheet:

  The `settings` data frame, or `NULL`.

## Value

A list with `settings` (named list, pipeline argument names) and
`problems`.
