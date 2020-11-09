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
fars_summarize_years <- function(years){
  dat_list <- fars_read_years(years)
  dplyr::bind_rows(dat_list) %>%
    dplyr::group_by(year, MONTH) %>%
    dplyr::summarize(n = n()) %>%
    tidyr::spread(year, n)
}