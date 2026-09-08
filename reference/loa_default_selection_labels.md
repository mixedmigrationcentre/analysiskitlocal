# The Pipeline's Own Selection-Count Labels

`count_selections_labels` is a length-three vector, so a workbook that
sets only one of the three still needs the other two. These are the
pipeline's defaults, and the only place in this file where a pipeline
default is restated.

## Usage

``` r
loa_default_selection_labels()
```

## Value

A character vector of length three: none, exactly one, more than one.
