# Turn Blank Strings into NA

ONA uses empty strings for skipped questions. Left as they are, ""
becomes a legitimate response category and inflates every denominator.

## Usage

``` r
ck_blank_to_na(dataset)
```

## Arguments

- dataset:

  A dataframe.

## Value

The dataframe with "" replaced by `NA` in character columns.
