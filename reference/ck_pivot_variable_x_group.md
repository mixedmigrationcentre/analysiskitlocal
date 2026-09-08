# Pivot a Long Analysis Table into Variable x Group Wide Format

ONA-flavoured replacement for
`presentresults::create_table_variable_x_group`. Differences:

- Reads `group_var` / `group_var_value` straight off the results table
  instead of round-tripping through the analysis key, so a label
  containing the key separators cannot break it.

- Column names are prefixed with the grouping variable
  (`stat_gender_male`), so two grouping variables sharing a value cannot
  collide.

- The ungrouped analysis is labelled explicitly instead of `"NA"`.

## Usage

``` r
ck_pivot_variable_x_group(
  results_table,
  value_columns = c("stat", "n", "n_total"),
  overall_label = "Overall",
  missing_group_label = "Missing",
  use_group_prefix = TRUE
)
```

## Arguments

- results_table:

  A long results table.

- value_columns:

  Statistic columns to spread. Default `c("stat", "n", "n_total")`.

- overall_label:

  Label for the ungrouped analysis. Default `"Overall"`.

- missing_group_label:

  Label for respondents missing a value on the grouping variable.
  Default `"Missing"`. These must not be folded into `overall_label` -
  they are a distinct, usually small, group.

- use_group_prefix:

  Logical. Prefix column names with the grouping variable name. Default
  `TRUE`.

## Value

A wide dataframe: one row per analysis_type / analysis_var /
analysis_var_value, one column per value column x group value.
