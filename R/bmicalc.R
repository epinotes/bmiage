#' Calculate BMI
#' 
#' The weight and the height should be respectively
#' in kilograms and meters.
#' It is use inside the main function of the package, bmicat.
#' 
#' @param kg Numeric. The person's weight in kilograms
#' @param m Numeric.  The person's height in meters
#' @export
#' @examples
#' bmicalc(kg = c(100,65), m = c(1.90, 1.65))
bmicalc <- function(kg, m){
  kg/m^2
} 