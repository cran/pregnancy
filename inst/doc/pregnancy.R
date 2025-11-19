## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(pregnancy)

## ----echo = FALSE-------------------------------------------------------------
# save any existing options
due_date_opt <- getOption("pregnancy.due_date")
person_opt <- getOption("pregnancy.person")
medications_opt <- getOption("pregnancy.medications")

## -----------------------------------------------------------------------------
# for purpose of vignette, calculate `start_date` relative to "today"
today <- Sys.Date()
start_date <- today - 192

# invisibly returns a Date object with the estimated due date
# by default, start date of last menstrual period, but other options available
# in practice, the start_date argument will be a known date, e.g. "2025-05-29"
due_date <- calculate_due_date(start_date)

## -----------------------------------------------------------------------------
how_far(due_date = due_date)
how_far(on_date = today + 1, due_date = due_date)

## -----------------------------------------------------------------------------
date_when(33, due_date = due_date)

## -----------------------------------------------------------------------------
how_far(due_date = due_date, person = 1)

## -----------------------------------------------------------------------------
date_when(33, due_date = due_date, person = "Ruth")

## -----------------------------------------------------------------------------
calculate_test_date(today - 20)

## -----------------------------------------------------------------------------
# a simplified medication schedule
meds <- pregnancy:::update_meds_table(pregnancy::medications_simple)
meds

## -----------------------------------------------------------------------------
medications_remaining(meds)

## -----------------------------------------------------------------------------
medications_remaining(meds, group = "format")

## -----------------------------------------------------------------------------
medications_remaining(
  meds,
  on_date = today + 3,
  until_date = today + 17
)

## -----------------------------------------------------------------------------
# a different due date from the earlier example
due_date <- today + 180
set_due_date(due_date)

## -----------------------------------------------------------------------------
how_far()

## -----------------------------------------------------------------------------
date_when(20)

## -----------------------------------------------------------------------------
set_person(1)
how_far() # due_date option still set from previous section
set_person(NULL)
how_far()

## -----------------------------------------------------------------------------
set_medications(pregnancy:::update_meds_table(pregnancy::medications))
medications_remaining()

## ----echo = FALSE-------------------------------------------------------------
# reset original options
options(
  pregnancy.due_date = due_date_opt,
  pregnancy.person = person_opt,
  pregnancy.medications = medications_opt
)

