# Match Choice Labels Against the Real Child Columns

The choice labels handed to `count_combinations` are matched against the
actual select_multiple child column suffixes, after trimming and (by
default) case-insensitively. 4Mi labels are long free text - "Armed
conflict, generalised violence, and insecurity" - so a silent miss would
produce a table that looks fine and is wrong. This returns the empty set
for a label that matches nothing, and the caller is expected to fail on
it.

## Usage

``` r
ck_resolve_choices(
  parent,
  wanted,
  data_names,
  sm_separator = "/",
  ignore_case = TRUE
)
```

## Arguments

- parent:

  The select_multiple parent variable name.

- wanted:

  Character vector of choice labels to find.

- data_names:

  Column names of the dataset.

- sm_separator:

  Separator between parent and choice. Default `"/"`.

- ignore_case:

  Logical. Match case-insensitively. Default `TRUE`.

## Value

A list the same length as `wanted`, each element the child column
name(s) matching that label.
