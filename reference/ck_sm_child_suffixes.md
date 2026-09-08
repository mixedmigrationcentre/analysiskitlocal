# Select Multiple Child Columns and Their Choice Suffixes

The suffix is taken by removing the *parent prefix only*, never by
splitting on the separator: 4Mi choice labels contain the separator
themselves (e.g.
`"QN9/Interception at sea/pull-back to point of embarkation"`), so a
split would truncate them.

## Usage

``` r
ck_sm_child_suffixes(parent, data_names, sm_separator = "/")
```

## Arguments

- parent:

  The select_multiple parent variable name.

- data_names:

  Column names of the dataset.

- sm_separator:

  Separator between parent and choice. Default `"/"`.

## Value

A named character vector: names are child columns, values are the choice
suffixes.
