# Split the ONA Label Row Off a Dataset

Row 1 of an ONA export is label text. Left in place it is counted as a
respondent: it adds a bogus category to every proportion and becomes
`NA` for every mean / median.

## Usage

``` r
ck_split_label_row(dataset, skip_label_row = TRUE)
```

## Arguments

- dataset:

  The raw ONA export.

- skip_label_row:

  Logical. Remove row 1 and return it. Default `TRUE`.

## Value

A list with `dataset` and `label_row` (or `NULL`).
