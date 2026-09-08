# Coerce Analysis Variables to Numeric, Reporting Losses

Everything below the ONA label row reads as text. Unlike a bare
[`as.numeric()`](https://rdrr.io/r/base/numeric.html), this reports how
many non-blank values failed to parse.

## Usage

``` r
ck_coerce_numeric(dataset, vars, verbose = TRUE)
```

## Arguments

- dataset:

  A dataframe.

- vars:

  Character vector of columns to coerce.

- verbose:

  Logical. Report coercion losses. Default `TRUE`.

## Value

The dataframe with `vars` coerced to numeric.
