# Build a Question Label Lookup from an ONA Label Row

In MMC 4Mi exports the label row for a select_multiple *child* column
simply repeats the column name (column `"QN9/Detention"` has label
`"QN9/Detention"`), which carries no information - the choice label is
already in the column name. Those self-referencing entries are dropped
so downstream code falls back to the column name, which is the better
label.

## Usage

``` r
ck_build_label_lookup(label_row, drop_self_labels = TRUE)
```

## Arguments

- label_row:

  A one-row dataframe: names are machine names, values are labels.

- drop_self_labels:

  Logical. Drop entries whose label equals the column name. Default
  `TRUE`.

## Value

A named character vector.
