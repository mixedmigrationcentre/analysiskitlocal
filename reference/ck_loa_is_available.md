# Which LOA Rows Can Be Run Against the Dataset

Handles ratios, whose variables live in `analysis_var_numerator` /
`analysis_var_denominator` rather than `analysis_var`.

## Usage

``` r
ck_loa_is_available(loa, dataset, sm_separator = "/")
```

## Arguments

- loa:

  The list of analyses.

- dataset:

  The analysis dataset.

- sm_separator:

  Select_multiple separator.

## Value

A logical vector, one element per LOA row.
