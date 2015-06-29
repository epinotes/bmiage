#' Convert feet and inches into meters 
#' From Google convert
#' 
#' @param feet Numeric. The feet part of the height
#' @param inches Numeric. The inch part of the height.
#' The default is 0
#' @export
#' @examples
#' ftin2m(feet = 10, inches = 7)
ftin2m <- function(feet,inches = 0){
  
  0.3048*feet + 0.3048*inches/12 
}