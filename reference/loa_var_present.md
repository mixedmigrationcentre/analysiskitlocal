# Is a Variable Usable in the Dataset

A variable counts as present when it is a column, or when it is a
select_multiple parent whose child columns are there. ONA exports do not
always carry the concatenated parent column, so testing column names
alone would declare every select_multiple missing.

## Usage

``` r
loa_var_present(vars, dataset, sm_separator = "/")
```

## Arguments

- vars:

  Character vector of variable names.

- dataset:

  The dataset.

- sm_separator:

  Select_multiple separator.

## Value

A logical vector the same length as `vars`.
