# A Reproducible Output Filename

Names the file after the dataset it came from and the moment it was
produced, so two runs of the same dataset never collide and a file found
later can be traced back.

## Usage

``` r
ak_output_filename(dataset_name, when = Sys.time(), prefix = "analysiskit")
```

## Arguments

- dataset_name:

  Original dataset filename.

- when:

  The run time. Defaults to now.

- prefix:

  Leading token.

## Value

A filename ending in `.xlsx`.
