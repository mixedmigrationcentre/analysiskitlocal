# Every Package This One Needs, and Why

The single source of truth. `need` is `"required"` (every run uses it,
and it is installed with the package) or `"optional"` (one feature needs
it). `repo` is the GitHub `org/repo` for the two that are not on CRAN,
and `NA` otherwise.

## Usage

``` r
ak_package_roster()
```

## Value

A data frame with `package`, `need`, `repo` and `purpose`.
