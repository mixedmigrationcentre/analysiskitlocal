# Find the Denominator Column to Read Sample Sizes From

The denominator can reach the formatter through either argument: as
`total_columns = c("n", "n_total")`, or folded into
`value_columns = c("stat", "n", "n_total")` with `total_columns` left
`NULL`. The block splitter cannot tell the two apart - it only counts
columns - so anything that reads sample sizes must not depend on which
was used. It looks at `total_columns` first, then at the base names the
blocks actually hold.

## Usage

``` r
ck_denominator_base(blocks, total_columns = NULL)
```

## Arguments

- blocks:

  The statistic blocks.

- total_columns:

  The `total_columns` argument, possibly `NULL`.

## Value

A base name, or `NULL` when the blocks carry no count column at all.
