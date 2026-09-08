# Take a Quoted Setting Verbatim

A spreadsheet will not carry a leading or trailing space: writing
` only` in a cell and reading it back gives `only`, and the label then
renders "Economiconly". The loss happens in the file format, before this
reader sees the value, so no amount of not-trimming here recovers it.

## Usage

``` r
loa_unquote(value)
```

## Arguments

- value:

  The trimmed cell value.

## Value

The value, unwrapped when it was quoted.

## Details

So a value wrapped in double quotes is taken exactly as written between
them. `" only"` survives the round trip; `only` behaves as before. This
applies to every text setting, not a special list of them, because any
of them could need an edge space.
