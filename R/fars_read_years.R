#'fars_read_years
#'
#'fars_read_years function: read a year (vector of years) and return a list of data.frames for each year.
#'
#'@param lapply applies an anonymous function to each element
#'of the list "years", which has to be of the same length.
#'The anonymous function first generates the file name
#'using "make_filename"-function and then try to read the file correspondingly
#'and create a data frame.
#'
#'@param fars_read_years
#'@param tryCatch() provides a mechanism for handling error or warnings.
#'@param mutate() preserves the selected variables.
#'@param select() select specified columns of the data frame.
#'@param warning() prints an error message.
#'
#'@importFrom dplyr::mutate
#'@importFrom dplyr::select
#'
#'@export
#'
#'@return This function returns a list of data.frames with month and year
#'of the motor vehicle traffic crashes.
#'Outherwise a warning "invalid year (year)" is printed out.
#'
#'@examples
#'\dontrun{
#'fars_read_years(2013)
#'fars_read_years(c(2013,2014))
#'}
#'
fars_read_years <- function(years){
  lapply(years, function(year){
    file <- make_filename(year)
    tryCatch({
      dat <- fars_read(file)
      dplyr::mutate(dat, year = year) %>%
        dplyr::select(MONTH, year)
    }, error = function(e){
      warning("invalid year: ", year)
      return(NULL)
    })
  })
}