# Check That a Folder Can Be Written To

Checked before the analysis is exported rather than after, so a run is
never lost to a folder that turns out to be read-only.

## Usage

``` r
ak_check_folder(folder)
```

## Arguments

- folder:

  Path to check.

## Value

`NULL` when the folder is usable, otherwise a message explaining why it
is not.
