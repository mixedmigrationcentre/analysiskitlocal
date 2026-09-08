# Which Group Blocks Actually Have Respondents on This Sheet

A grouping variable's levels are fixed across the whole table, so a
country with no interviews for the questions on one sheet still gets a
full block of columns there - every cell empty, or `#NUM!` where the
estimator divided nothing by nothing. Those blocks are dropped.

## Usage

``` r
ck_nonempty_blocks(dat, rows, blocks, idx, sample_base = NULL)
```

## Arguments

- dat:

  The table.

- rows:

  The sheet's row indices.

- blocks:

  All statistic blocks.

- idx:

  The block indices assigned to this sheet.

- sample_base:

  Base name of the denominator column (e.g. `"n_total"`), or `NULL`.

## Value

The subset of `idx` worth writing. If every block would go, `idx` is
returned unchanged rather than producing a sheet with no columns.

## Details

A block counts as having respondents when its denominator column holds a
finite value above zero somewhere in the sheet's rows. With no count
column to read, the fallback is whether any statistic in the block is
finite at all; `NaN` and `Inf` are not, which is exactly the case being
removed.

The Overall block is never dropped - it is the reference column, and
dropping it would leave a sheet with nothing to compare against.
