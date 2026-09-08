# Sample Size of Each Group Block

The number of respondents behind a block is the largest denominator
recorded for it across the rows considered - the same rule the block
headers and the readme composition table use, so the three always agree.

## Usage

``` r
ck_block_sample_sizes(dat, blocks, sample_base, rows = NULL)
```

## Arguments

- dat:

  The table.

- blocks:

  The statistic blocks.

- sample_base:

  Base name of the denominator column (e.g. `"n_total"`), or `NULL` when
  the table carries no count column.

- rows:

  Optional row indices to restrict to. Defaults to the whole table.

## Value

A numeric vector, one element per block, `NA` where no finite
denominator was recorded.
