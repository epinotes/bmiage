% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/bmicalc.R
\name{bmicalc}
\alias{bmicalc}
\title{Calculate BMI}
\usage{
bmicalc(kg, m)
}
\arguments{
\item{kg}{Numeric. The person's weight in kilograms}

\item{m}{Numeric.  The person's height in meters}
}
\description{
The weight and the height should be respectively
in kilograms and meters.
It is use inside the main function of the package, bmicat.
}
\examples{
bmicalc(kg = c(100,65), m = c(1.90, 1.65))
}

