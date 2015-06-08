
dob2months <- function(dob, date) {
  # calculate number of months from date of birth to date of measurement
  # dob: date of birth
  # date: date fo measurement
  # both dates are in the format "mm/dd/yyyy"
  require(lubridate)
  mdy(dob) %--% mdy(date) %/% months(1) 
}