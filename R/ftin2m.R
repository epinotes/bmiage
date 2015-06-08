ftin2m <- function(feet,inches = 0){
  #feet and inches into meters
  # feet: portion of height in feet
  # inches: portion of height in inches
  0.3048*feet + 0.3048*inches/12 
}