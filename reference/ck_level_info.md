# Resolve the Confidence Level for Each LOA Row

`level` is optional. An empty cell (or a missing column) means no
confidence interval is reported for that analysis. `analysistools`
always requests an interval, so `fallback_level` is handed to it as an
internal placeholder; the `supplied` flag is what the pipeline uses
afterwards to blank `stat_low` / `stat_upp` on those rows, and what
routes them to the fast engine. Percentages are accepted: 95 reads as
0.95.

## Usage

``` r
ck_level_info(loa, fallback_level = 0.95)
```

## Arguments

- loa:

  The list of analyses.

- fallback_level:

  Placeholder level for rows with none. Default `0.95`.

## Value

A list with `level` (numeric) and `supplied` (logical), one element per
row.
