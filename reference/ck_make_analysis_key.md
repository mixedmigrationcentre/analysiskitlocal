# Build the analysistools Analysis Key

Reproduces `type @/@ var %/% value @/@ group %/% group_value` so the
fast engine's output is interchangeable with `create_analysis()` output.
Nothing in this file parses it.

## Usage

``` r
ck_make_analysis_key(
  analysis_type,
  analysis_var,
  analysis_var_value,
  group_var,
  group_var_value
)
```

## Arguments

- analysis_type, analysis_var, analysis_var_value, group_var,
  group_var_value:

  Character vectors of the same length.

## Value

A character vector of analysis keys.
