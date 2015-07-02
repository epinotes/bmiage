# bmiage 

A package to calculate BMI for age and sex. It uses CDC child bmi charts to assign each bmi to the four categories: **underweight**, **healthy weight**, **overweight** and **obese**.  

### To install the package:
```r
devtools::install_github("epinotes/bmiage")
 library(bmiage)
 
```
### Examples

```r
?bmicat

# No dataset provided
 
 bmicat(data = NULL,sex = "F",age = 18,wt.kg = 70 ,ht.m = 1.75, age.unit="year",bind = F)
 
# Create and provide data frame df first:
 
 df <- data.frame(sex = c("F","M", "F"), age = c(18,15,NA), weight = c(70,50, 55), height = c(1.75, 1.60, 1.65))
 
# Use the new data frame, df with the function bmicat:
 
 bmicat(data = df,sex = sex,age = age,wt.kg = weight ,ht.m = height, age.unit="year",bind = T)

```