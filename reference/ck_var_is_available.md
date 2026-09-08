# Check Which Analysis Variables Are Usable in an ONA Export

A variable is usable if it is a column in the dataset, or if it is a
select_multiple parent whose child columns are present. ONA does not
always carry the concatenated parent column, so filtering on column
names alone silently drops every select_multiple analysis.

## Usage

``` r
ck_var_is_available(vars, dataset, sm_separator = "/")
```

## Arguments

- vars:

  Character vector of variable names.

- dataset:

  The analysis dataset.

- sm_separator:

  Select_multiple separator. Default `"/"`.

## Value

A logical vector the same length as `vars`.
