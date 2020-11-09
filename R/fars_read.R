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
fars_read <- function(filename){
  if(!file.exists(filename))
    stop("file", filename, " does not exist")
  data <- suppressMessages({
    readr::read_csv(filename, progress = FALSE)
  })
  dplyr::tbl_df(data)
}