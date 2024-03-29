## ----include = FALSE----------------------------------------------------------
library(readr)
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## -----------------------------------------------------------------------------
parse_integer(c("1", "2", "3"))
parse_double(c("1.56", "2.34", "3.56"))
parse_logical(c("true", "false"))

## -----------------------------------------------------------------------------
parse_number(c("0%", "10%", "150%"))
parse_number(c("$1,234.5", "$12.45"))

## -----------------------------------------------------------------------------
parse_datetime("2010-10-01 21:45")
parse_date("2010-10-01")
parse_time("1:00pm")

## -----------------------------------------------------------------------------
parse_datetime("1 January, 2010", "%d %B, %Y")
parse_datetime("02/02/15", "%m/%d/%y")

## -----------------------------------------------------------------------------
parse_factor(c("a", "b", "a"), levels = c("a", "b", "c"))
parse_factor(c("a", "b", "d"), levels = c("a", "b", "c"))

## -----------------------------------------------------------------------------
guess_parser(c("a", "b", "c"))
guess_parser(c("1", "2", "3"))
guess_parser(c("1,000", "2,000", "3,000"))
guess_parser(c("2001/10/10"))

## -----------------------------------------------------------------------------
guess_parser("$1,234")
parse_number("$1,234")

## -----------------------------------------------------------------------------
x <- spec_csv(readr_example("challenge.csv"))

## -----------------------------------------------------------------------------
mtcars_spec <- spec_csv(readr_example("mtcars.csv"))
mtcars_spec

cols_condense(mtcars_spec)

## -----------------------------------------------------------------------------
x <- spec_csv(readr_example("challenge.csv"), guess_max = 1001)

## -----------------------------------------------------------------------------
df1 <- read_csv(readr_example("challenge.csv"))

## -----------------------------------------------------------------------------
problems(df1)

## -----------------------------------------------------------------------------
df2 <- read_csv(readr_example("challenge.csv"), guess_max = 1001)

## -----------------------------------------------------------------------------
#> Parsed with column specification:
#> cols(
#>   x = col_integer(),
#>   y = col_character()
#> )

## -----------------------------------------------------------------------------
spec(df1)
spec(df2)

## -----------------------------------------------------------------------------
df3 <- read_csv(
  readr_example("challenge.csv"), 
  col_types = list(
    x = col_double(),
    y = col_date(format = "")
  )
)

