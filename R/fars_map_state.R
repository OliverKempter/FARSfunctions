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
fars_map_state <- function(state.num, year){
  filename <- make_filename(year)
  data <- fars_read(filename)
  state.num <- as.integer(state.num)
  if(!(state.num %in% unique(data$STATE)))
    stop("invalid STATE number: ", state.num)
  data.sub <- dplyr::filter(data, STATE == state.num)
  if(nrow(data.sub) == 0L){
    message("no accidents to plot")
    return(invisible(NULL))
  }
  is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
  is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
  with(data.sub, {
    maps::map("state", ylim = range(LONGITUD, na.rm = TRUE))
    graphics::points(LONGITUD, LATITUDE, pch = 46)
  })
}