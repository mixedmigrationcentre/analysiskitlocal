# Collect a Function's Messages and Warnings Into a Log

The pipeline's [`message()`](https://rdrr.io/r/base/message.html) output
is its progress report and its diagnostics. Captured rather than
muffled, it becomes the run log; captured rather than printed, a
`verbose` run does not bury the console.

## Usage

``` r
with_run_log(expr, echo = TRUE)
```

## Arguments

- expr:

  The expression to evaluate.

- echo:

  Logical. Also print each line as it arrives.

## Value

A list with `value` and `log`.

## Details

Warnings are collected too, prefixed so they stand out, and are *not*
re-raised: a run that skipped three variables should say so once in the
log, not fire three warnings at the end when it is too late to read them
in order.
