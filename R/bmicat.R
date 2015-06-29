#' Calculate the bmi and classify it into 
#' underweight (0), healthy weight (1),overweight (2) and obese (3),
#' based on CDC's BMI reference tables for age and sex.
#' 
#' 
#' @param data A data frame. The default is NULL.
#' When the data frame is provided, use the corresponding variables for
#' the parameters sex, age, wt.kg and ht.m.
#' @param sex Character. "F", "M"
#' @param age Numeric. In months or years
#' @param wt.kg Numeric. Weight in kg
#' @param ht.m Numeric. Height in meters
#' @param age.unit Character. The age unit ("month" or "year")
#' @param bind Logical. TRUE or FALSE.
#' Add the two new variables to the data provided.
#' They are the calculated BMI (bmi) and the BMI categories (bmicat).
#' The variable "bmicat" is coded as numeric from 0,1,2 or 3 for
#' respectively "underweight", "healthy weight", "overweight" and "obesity" 
#' @export
#' @examples
#' 
#' No dataset provided
#' 
#' bmicat(data = NULL,sex = "F",age = 18,wt.kg = 70 ,ht.m = 1.75, age.unit="year",bind = F)
#' 
#' Create and provide data frame df first:
#' 
#' df <- data.frame(sex = c("F","M", "F"), age = c(18,15,NA), weight = c(70,50, 55), height = c(1.75, 1.60, 1.65))
#' 
#' Use the new data frame, df with the function bmicat:
#' 
#' bmicat(data = df,sex = sex,age = age,wt.kg = weight ,ht.m = height, age.unit="year",bind = T)
bmicat <-function(data = NULL,sex,age,wt.kg ,ht.m, age.unit=c("none","year","month"),bind = T){
  

  require(dplyr)
  require(foreach)
  
  
  if(!(age.unit %in% c("year","month")) ) stop("select an age.unit argument as 'month' or 'year'")
  
  if (bind) {
    if(is.null(data)) stop("When 'bind' is 'TRUE' you need to provide a dataset for the argument 'data'")
  }    
  
  ref <- cdc_bmiagesex 
  age2 <- eval(substitute(age),data, parent.frame())
  sex2 <- eval(substitute(sex),data, parent.frame()) # "M" or "F"
  wt.kg <- eval(substitute(wt.kg),data, parent.frame())
  ht.m <- eval(substitute(ht.m),data, parent.frame())
  
  s_bmi <- round(wt.kg/(ht.m^2),5)
  
  age2 <- switch(match.arg(age.unit),none= NA, year=floor(12*age2)+.5,month=floor(age2)+.5)
  
  dat <- foreach::foreach(i=1:length(sex2), .combine='rbind') %do% {
    id <- paste0(sex2[i],age2[i])
    bmi2 <-data.frame(id=id,s_bmi = s_bmi[i])
    bmi2["id"] <- lapply( bmi2["id"], as.character)
    bmi3 <- left_join(bmi2,ref,by="id")
    bmistatus <- bmi3 %>% mutate(bmicat = (s_bmi > bmi)) %>% summarise(sum(bmicat))
  dat2 <- data.frame(bmi = bmi3$s_bmi[1],bmicat = unname(unlist(bmistatus)))
  dat2$bmicat[dat2$bmi > 30] <- 3
  return(dat2)
    
  }
  
  if(bind) {
    if(!is.null(data)) cbind(data,dat)
  } else { 
    return(dat)   
  }
}
