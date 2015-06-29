#' Calculate the number of months 
#' from date of birth to date of measurement
#' 
#' Dates should be in the format "yyyy-mm-dd".
#' Reformat the dates if needed.
#' 
#' @param dob Date. The date of birth
#' @param date Date.  The date of measurement
#' @export
#' @examples
#' dob2months(dob= "1998-10-20", date = "2015-06-12")
dob2months <- function(dob, date) {
  require(lubridate)
  dob %--% date %/% months(1) 
}