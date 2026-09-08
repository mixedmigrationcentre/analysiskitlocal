# Weighted Median

The standard lower weighted median: the smallest observed value at which
the cumulative weight reaches half the total. Note this returns an
*observed* data value, whereas `survey::svyquantile()` interpolates by
default, so the two can differ by one step between adjacent
observations. For the integer 4Mi indicators (age, months, counts) they
agree.

## Usage

``` r
ck_weighted_median(x, w)
```

## Arguments

- x:

  Numeric vector.

- w:

  Numeric weights.

## Value

A single numeric value, or `NA`.
