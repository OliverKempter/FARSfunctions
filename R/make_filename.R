#' make_filename
#'
#'   function: creates a file.
#'
#'@param make_filename
#'@param as.integer() Classify its argument to be of integer type.
#'@param sprintf() Provides a string formatting. Input is the year.
#'
#'@return This function returns a character vector,
#'containing a formatted combination of text and variable values.
#'
#'@export
#'
#'@examples
#'make_filename(2013)
#'make_filename(2014)
#'
make_filename <- function(year){
  year <- as.integer(year)
  sprintf("accident_%d.csv.bz2", year)
}