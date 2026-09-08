# Emit a Pipeline Progress Message

Uses [`message()`](https://rdrr.io/r/base/message.html) rather than
[`cat()`](https://rdrr.io/r/base/cat.html) so callers can silence the
pipeline with
[`suppressMessages()`](https://rdrr.io/r/base/message.html).

## Usage

``` r
ck_note(..., verbose = TRUE)
```

## Arguments

- ...:

  Pasted into a single message.

- verbose:

  Logical. If `FALSE` nothing is emitted.
