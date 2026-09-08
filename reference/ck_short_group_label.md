# Drop the Disaggregation Variable Prefix from a Group Label

`analysistools::unite_variables()` names each group value after its
variable, so a block comes back as `"Respondent_Gender_Female"`. Where
the variable name is already shown in the band above, repeating it in
every column just makes the header unreadable, so it is stripped back to
`"Female"`.

## Usage

``` r
ck_short_group_label(label, group_variable)
```

## Arguments

- label:

  The group value label.

- group_variable:

  The disaggregation variable the group belongs to.

## Value

The shortened label, or the original when there is nothing to strip.
