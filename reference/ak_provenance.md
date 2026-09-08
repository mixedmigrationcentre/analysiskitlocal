# Provenance Lines for the Workbook's Readme Sheet

The record of what produced the file travels inside the file, rather
than in a second document that can be separated from it.

## Usage

``` r
ak_provenance(spec, dataset_name, when = Sys.time())
```

## Arguments

- spec:

  The `analysis_spec` behind the run.

- dataset_name:

  Original dataset filename.

- when:

  The run time.

## Value

A character vector of readme lines.
