# Run a Pipeline Validator and Convert its Error into a Problem

The pipeline already validates `count_selections` and
`count_combinations`, with better messages than a second implementation
would produce. Rather than duplicate those checks, they are called here
when available and their condition is turned into a problem row.

## Usage

``` r
loa_delegate_check(fn, args, sheet)
```

## Arguments

- fn:

  Name of the validator function.

- args:

  List of arguments.

- sheet:

  Sheet to attribute any problem to.

## Value

A problems data frame.
