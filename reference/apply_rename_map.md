# Apply a Rename Map to a Dataset

Renames the column itself **and every select_multiple child** sharing
the `<old><sm_separator>` prefix. Renaming `Q78` without rewriting
`Q78/Economic reasons` would sever the parent-child link, and every
select_multiple analysis of that question would silently return nothing.

## Usage

``` r
apply_rename_map(dataset, map, sm_separator = "/")
```

## Arguments

- dataset:

  A data frame.

- map:

  A named character vector: names are the current names, values the new
  ones.

- sm_separator:

  Select_multiple separator.

## Value

`dataset` with its columns renamed.

## Details

The whole map is applied in one pass over the original names, so a map
that happens to rename `A` to `B` and `B` to `C` cannot chain `A`
through to `C`.
