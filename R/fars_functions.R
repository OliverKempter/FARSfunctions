library("devtools")
library("magrittr")
library("roxygen2")

#'
#'Fatal injuries suffered in motor vehicle traffic crashes
#'
#'@source US National Highway Traffic Safety Administration's
#'Fatality Analysis Reporting System - injuries suffered in 'motor vehicle
#' traffic crashes in 2013, 2014 and 2015. \url{https://www.nhtsa.gov/
#' research-data/fatality-analysis-reporting-system-fars"accident_2013.csv.bz2"}
#'
#'
#'fars_read
#'
#'fars_read function: prints out a list of data.frames of motor vehicle traffic crashes.
#'
#'@param fars_read
#'@param if(!file.exists(filename)) Condition that the file name exists.
#'@param stop() Function processing stops and an error is printed.
#'@param suppressMessages({}) Message that csv-data has been loaded
#'is suppressed.
#'@param read_csv() Reads comma and tab separated values (.csv).
#'@param tbl_df() Prints out a list of data.frames.
#'
#'@importFrom readr::read_csv
#'@importFrom dplyr::tbl_df
#'
#'@export
#'
#'@return This function returns a list of data.frames, if the file name exists.
#'If it does not exists a message "file (filename) does not exist" is returned.
#'Information about loaded data is suppressed.
#'
#'@examples
#'\dontrun{
#'fars_read("accident_2013.csv")
#'fars_read("accident_2020.csv")
#'
#'fars_read <- function(filename){
#'  if(!file.exists(filename))
#'    stop("file", filename, " does not exist")
#'  data <- suppressMessages({
#'    readr::read_csv(filename, progress = FALSE)
#'  })
#'  dplyr::tbl_df(data)
#'}
#'
#'
#'
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
#'make_filename <- function(year){
#'  year <- as.integer(year)
#'  sprintf("accident_%d.csv.bz2", year)
#'}
#'
#'
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
#'fars_read_years <- function(years){
#'  lapply(years, function(year){
#'    file <- make_filename(year)
#'    tryCatch({
#'      dat <- fars_read(file)
#'      dplyr::mutate(dat, year = year) %>%
#'        dplyr::select(MONTH, year)
#'    }, error = function(e){
#'      warning("invalid year: ", year)
#'      return(NULL)
#'    })
#'  })
#'}
#'
#'
#'
#'fars_summarize_years
#'
#'fars_summarize_years function: binds the imputed year (or years) together,
#'and print out a summary of total motor vehicle traffic crashes by month for the specified year (or years).
#'
#'@param fars_summarize_years
#'@param bind_rows() combines columns, which are matched by name.
#'@param group_by() groups the summarized variables by inputed arguments.
#'@param summarize() creates a new data frame with the requested summaries.
#'@param spread() specify the name of the column to use for the new column names
#'and then specify the column to use for the cell value.
#'Converts the data frame from a long format to a wide format.
#'
#'@importFrom dplyr::bind_rows
#'@importFrom dplyr::group_by
#'@importFrom dplyr::summarize
#'@importFrom tidyr::spread
#'
#'@return This function returns the year and number of injuries
#'suffered in motor vehicle traffic crashes per month for a specified year.
#'
#'@export
#'
#'@examples
#'\dontrun{
#'fars_summarize_years(2013)
#'fars_summarize_years(c(2013,2014))
#'}
#'
#'fars_summarize_years <- function(years){
#'  dat_list <- fars_read_years(years)
#'  dplyr::bind_rows(dat_list) %>%
#'    dplyr::group_by(year, MONTH) %>%
#'    dplyr::summarize(n = n()) %>%
#'    tidyr::spread(year, n)
#'}
#'
#'
#'fars_map_state
#'
#'fars_map_state function: creates a map of motor vehicle traffic crashes.
#'Input is the state number and year of motor vehicle traffic crash.
#'
#'@param fars_map_state
#'@param state.num() is of integer type class.
#'@param stop() Function processing stops and an error is printed.
#'@param data.sub() a data file with the state number.
#'Prints out a message "no accidents to plot", if the number of rows is equal
#'to 0.
#'@param filter() selects a specified column.
#'Longitude higher than 900 and latitude higher than 90 is set to NA.
#'@param with() maps the location of the crash in form of a rectangle.
#'Missing values are ignored.
#'
#'@importFrom dplyr::filter
#'@importFrom maps::map
#'@importFrom graphics::points
#'
#'@return Prints out a map with the location of motor vehicle traffic crashes.
#'In case the state number is invalid, a warning message
#'"invalid STATE number: (state.num)" is given.
#'If the number of rows in the data.sub is equal to 0, a message "no accidents to plot" is printed.
#'
#'@export
#'
#'@examples
#'\dontrun{
#'fars_map_state(2013)
#'fars_map_state(2014)
#'}
#'
#'fars_map_state <- function(state.num, year){
#'  filename <- make_filename(year)
#'  data <- fars_read(filename)
#'  state.num <- as.integer(state.num)
#'  if(!(state.num %in% unique(data$STATE)))
#'    stop("invalid STATE number: ", state.num)
#'  data.sub <- dplyr::filter(data, STATE == state.num)
#'  if(nrow(data.sub) == 0L){
#'    message("no accidents to plot")
#'    return(invisible(NULL))
#'  }
#'  is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
#'  is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
#'  with(data.sub, {
#'    maps::map("state", ylim = range(LONGITUD, na.rm = TRUE))
#'    graphics::points(LONGITUD, LATITUDE, pch = 46)
#'  })
#'}
#'
#'
