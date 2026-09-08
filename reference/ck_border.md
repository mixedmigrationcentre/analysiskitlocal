# Build a Border Specification

openxlsx assigns colours and styles to sides in the order the side names
appear in the `border` string, so all three values are built together.

## Usage

``` r
ck_border(
  sides = c("Top", "Bottom", "Left", "Right"),
  thick = character(0),
  thin_colour = "#AFDFE4",
  thick_colour = "#003D58"
)
```

## Arguments

- sides:

  Any of "Top", "Bottom", "Left", "Right".

- thick:

  Which of those sides should be thick.

- thin_colour:

  Colour of the thin sides.

- thick_colour:

  Colour of the thick sides.

## Value

A list with `border`, `borderColour` and `borderStyle`.
