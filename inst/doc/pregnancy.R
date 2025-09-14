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
# invisibly returns a Date object with the estimated due date
due_date <- calculate_due_date("2025-02-24")

## -----------------------------------------------------------------------------
how_far(due_date = due_date)
how_far(on_date = "2025-09-17", due_date = due_date)

## -----------------------------------------------------------------------------
date_when(33, due_date = due_date)

## -----------------------------------------------------------------------------
how_far(due_date = due_date, person = 1)

## -----------------------------------------------------------------------------
date_when(33, due_date = due_date, person = "Ruth")

## -----------------------------------------------------------------------------
calculate_test_date("2025-08-21")

## -----------------------------------------------------------------------------
# a simplified medication schedule
meds <- dplyr::tribble(
  ~medication, ~format, ~quantity, ~start_date, ~stop_date,
  "progynova", "tablet", 3, "2025-08-21", "2025-08-31",
  "progynova", "tablet", 6, "2025-09-01", "2025-09-11",
  "cyclogest", "pessary", 2, "2025-09-03", "2025-09-11",
  "clexane", "injection", 1, "2025-09-08", "2025-11-05"
)

## -----------------------------------------------------------------------------
medications_remaining(meds)

## -----------------------------------------------------------------------------
medications_remaining(meds, group = "format")

## -----------------------------------------------------------------------------
medications_remaining(
  meds,
  on_date = "2025-09-01",
  until_date = "2025-09-14"
)

## -----------------------------------------------------------------------------
# can be intentional about creating a Date object
due_date <- as.Date("2026-01-22")
set_due_date(due_date)

## -----------------------------------------------------------------------------
how_far()

## -----------------------------------------------------------------------------
set_person(1)
how_far() # due_date option still set from previous section
set_person(NULL)
how_far()

## -----------------------------------------------------------------------------
set_medications(pregnancy::medications)
medications_remaining()

## ----echo = FALSE-------------------------------------------------------------
# reset original options
options(
  pregnancy.due_date = due_date_opt,
  pregnancy.person = person_opt,
  pregnancy.medications = medications_opt
)

