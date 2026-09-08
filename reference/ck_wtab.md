# Weighted and Unweighted Two-Way Tabulation

One-pass cross-tabulation of `x` by `g` returning both weighted and
unweighted cell counts. Uses
[`rowsum()`](https://rdrr.io/r/base/rowsum.html) on an integer cell
index, which is O(n) and does not copy the data per group.

## Usage

``` r
ck_wtab(w, g, x, x_levels = NULL)
```

## Arguments

- w:

  Numeric weights.

- g:

  Group vector (character).

- x:

  Value vector.

- x_levels:

  Optional value levels in reporting order. Levels with no respondents
  come back as a zero rather than disappearing - which is what a derived
  category such as "no choice selected" needs.

## Value

A list with matrices `w` and `n`; rows = groups, columns = values.
