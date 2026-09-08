# Work Out Which Sheets to Write

Two kinds of split can be combined:

- `"group_variable"` splits down the *columns*: each disaggregation
  variable (country, town, ...) gets its own sheet.

- Any identifier column name splits down the *rows*: each value of
  `sector`, `indicator`, `analysis_type`, ... gets its own sheet.

## Usage

``` r
ck_build_sheet_plan(
  dat,
  blocks,
  block_group,
  overall_idx,
  n_index,
  split_by,
  repeat_overall,
  table_sheet_name,
  readme_sheet_name,
  max_sheets,
  say = function(...) invisible(NULL)
)
```

## Arguments

- dat:

  The table, after renaming.

- blocks:

  The statistic blocks.

- block_group:

  Grouping variable of each block.

- overall_idx:

  Index of the Overall block(s).

- n_index:

  Number of identifier columns before the statistics.

- split_by:

  `"none"`, `"group_variable"` and/or column names.

- repeat_overall:

  Logical. Repeat the Overall block on every sheet.

- table_sheet_name:

  Fallback sheet name.

- readme_sheet_name:

  Reserved sheet name.

- max_sheets:

  Maximum number of sheets to allow.

- say:

  Progress function.

## Value

A list with `sheets` (each with `name`, `description`, `rows`, `blocks`)
and the resolved `split_by`.
