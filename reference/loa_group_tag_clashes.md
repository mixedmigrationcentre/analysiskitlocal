# Find Grouping Variables Whose Output Columns Would Be Misattributed

The wide table names its columns `stat_<group>_<value>` and the
`column_map` then works out which disaggregation each column belongs to
by looking for `_<group>_`, first match wins. Two consequences, both
silent:

## Usage

``` r
loa_group_tag_clashes(
  group_variables,
  dataset = NULL,
  raw_names = NULL,
  missing_group_label = "Missing"
)
```

## Arguments

- group_variables:

  Grouping variables, excluding `Overall`.

- dataset:

  Optional dataset, used to test the real levels.

- raw_names:

  Optional named vector mapping each grouping variable to the raw
  dataset column its levels come from.

- missing_group_label:

  Label used for respondents missing on a grouping variable.

## Value

A data frame with `group_variable`, `column` and `attributed_to`.

## Details

- a grouping variable whose name is contained in another's - `Region`
  and `Region_of_origin` - takes ownership of the other's columns;

- a grouping variable with a level literally called `Overall`, or a
  level that completes another variable's tag, lands in the wrong block.

The table itself is still correct; the map that says what the columns
mean is not. That is why this is fatal rather than a warning.
