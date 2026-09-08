# Consecutive Runs of One Value

Used to break the readme's sample-composition table into one block per
disaggregation variable, so a blank row can be left between them.

## Usage

``` r
ck_value_runs(x)
```

## Arguments

- x:

  A vector.

## Value

A list of integer index vectors, one per run, in order.

## Details

Runs of *consecutive* equal values rather than a split by unique value:
the composition table arrives in block order, and if a variable ever
appeared in two separate stretches, quietly stitching them together
would misrepresent the order the workbook is actually in.
