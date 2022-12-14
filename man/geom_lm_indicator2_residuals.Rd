% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geom_lm_indicator2.R, R/geom_lm_squared.R
\name{geom_lm_indicator2_residuals}
\alias{geom_lm_indicator2_residuals}
\title{Title}
\usage{
geom_lm_indicator2_residuals(
  mapping = NULL,
  data = NULL,
  position = "identity",
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE,
  ...
)

geom_lm_indicator2_residuals(
  mapping = NULL,
  data = NULL,
  position = "identity",
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE,
  ...
)

geom_lm_indicator2_residuals(
  mapping = NULL,
  data = NULL,
  position = "identity",
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE,
  ...
)

geom_lm_indicator2_residuals(
  mapping = NULL,
  data = NULL,
  position = "identity",
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE,
  ...
)
}
\arguments{
\item{...}{}
}
\value{







}
\description{
Title

Title

Title

Title
}
\examples{
library(ggplot2)
ggplot(palmerpenguins::penguins) +
  aes(x = flipper_length_mm ) +
  aes(y = body_mass_g ) +
  geom_point() + aes(color = species) +
  aes(indicator = species) +
  geom_lm_indicator() +
  geom_lm_indicator_formula() +
  geom_lm_indicator_fitted(color = "blue") +
  geom_lm_indicator_residuals(color = "red") +
  geom_lm_indicator_rsquared()
library(ggplot2)
ggplot(palmerpenguins::penguins) +
  aes(x = flipper_length_mm ) +
  aes(y = body_mass_g ) +
  geom_point() + aes(color = species) +
  aes(indicator = species) +
  geom_lm_indicator() +
  geom_lm_indicator_formula() +
  geom_lm_indicator_fitted(color = "blue") +
  geom_lm_indicator_residuals(color = "red") +
  geom_lm_indicator_rsquared()
}
