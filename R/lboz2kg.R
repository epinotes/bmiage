#' Convert pounds and ounces into mkilograms 
#' From Google convert
#' 
#' @param pounds Numeric. The pound part of the weight
#' @param ounces Numeric. The ounce part of the height.
#' The default is 0
#' @export
#' @examples
#' lboz2kg(pounds = 150, ounces = 5)
lboz2kg<-function(pounds,ounces=0)
{
  0.453592*pounds +  0.453592*ounces/16
  
}
