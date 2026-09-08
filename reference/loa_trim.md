# Trim Leading and Trailing Whitespace

Trims only. Internal whitespace is never collapsed, because 4Mi choice
labels must match the export character for character and squishing them
would break a label that legitimately contains a double space.

## Usage

``` r
loa_trim(x)
```

## Arguments

- x:

  A vector.

## Value

A character vector with `""` and the literal `"NA"` as `NA`.
