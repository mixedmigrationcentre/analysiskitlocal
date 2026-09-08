# Attach LOA Metadata Columns to a Results Table

Joins DAP columns such as `sector` or `indicator` onto the results.
Deduplicated first and explicitly many-to-one, so a DAP with more than
one row per analysis_type + analysis_var cannot silently multiply result
rows. Run after the pivot, so it can never split rows.

## Usage

``` r
ck_attach_loa_metadata(results_table, loa, extra_columns = NULL)
```

## Arguments

- results_table:

  A results table with `analysis_type` and `analysis_var`.

- loa:

  The original LOA (before stacking).

- extra_columns:

  LOA columns to carry through.

## Value

`results_table` with the metadata columns at the front.
