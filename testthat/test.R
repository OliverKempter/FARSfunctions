library("testthat")

test_that("functions performance_2013", {
  data(accident_2013)
  file2020 <- make_filename(2020)
  warning_fars_read_years <- fars_read_years(2020)
  expect_that(error_fars_read, throws_error("fileaccident_2020.csv does not exist"))
  expect_that(file2020, is_equivalent_to("accident_2020.csv.bz2"))
})

test_that("functions performance_2014", {
  data(accident_2014)
  file2020 <- make_filename(2020)
  warning_fars_read_years <- fars_read_years(2020)
  expect_that(error_fars_read, throws_error("fileaccident_2020.csv does not exist"))
  expect_that(file2020, is_equivalent_to("accident_2020.csv.bz2"))
})

test_that("functions performance_2015", {
  data(accident_2015)
  file2020 <- make_filename(2020)
  warning_fars_read_years <- fars_read_years(2020)
  expect_that(error_fars_read, throws_error("fileaccident_2020.csv does not exist"))
  expect_that(file2020, is_equivalent_to("accident_2020.csv.bz2"))
})