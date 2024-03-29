% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geom_lm_cat2_prediction.R
\name{compute_panel_cat2_intercept}
\alias{compute_panel_cat2_intercept}
\title{Title}
\usage{
compute_panel_cat2_intercept(data, scales)
}
\arguments{
\item{scales}{}
}
\description{
Title
}
\examples{
library(tidyverse)
cars \%>\%
mutate(cat = dist > 50) \%>\%
  rename(x = speed,
         y = dist) \%>\%
  compute_panel_cat_intercept()
}
