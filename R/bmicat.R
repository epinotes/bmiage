
bmicat <-function(data = NULL,sex,age,wt.kg ,ht.m, age.unit=c("none","year","month"),bind = T){
  
# to calculate the bmi and classify into underweight, healthy weight,
# overweight and obese based cdc on references table for age and sex
  
  #require(dplyr)
  #require(foreach)
  
  
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
    data.frame(bmi = bmi3$s_bmi[1],bmicat = unname(unlist(bmistatus)))
    
  }
  
  if(bind) {
    if(!is.null(data)) cbind(data,dat)
  } else { 
    return(dat)   
  }
}
