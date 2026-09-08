# Summarise the Sample Composition

The number of respondents in a group is the largest denominator recorded
for that group across all the analyses; the share is that number over
the whole sample.

## Usage

``` r
ck_sample_composition(dat, blocks, block_group, sample_base)
```

## Arguments

- dat:

  The table.

- blocks:

  All statistic blocks.

- block_group:

  Grouping variable of each block.

- sample_base:

  Base name of the denominator column (e.g. `"n_total"`).

## Value

A list with `total` and `table` (disaggregation / group / share / n /
n_total), or `NULL` when there is no denominator column to read.
