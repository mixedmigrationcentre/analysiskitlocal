# Find a Path That Does Not Already Exist

A second run inside the same second would otherwise overwrite the first.

## Usage

``` r
ak_unique_path(folder, filename, limit = 99L)
```

## Arguments

- folder:

  Destination folder.

- filename:

  Preferred filename.

- limit:

  How many suffixes to try before giving up.

## Value

A full path that does not exist.
