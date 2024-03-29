% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geom_lm_interaction.R
\name{geom_lm_interaction_residuals}
\alias{geom_lm_interaction_residuals}
\title{Title}
\usage{
geom_lm_interaction_residuals(
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
\description{
Title
}
\examples{
library(ggplot2)
ggplot(palmerpenguins::penguins) +
  aes(x = flipper_length_mm ) +
  aes(y = body_mass_g ) +
  geom_point() + aes(color = species) +
  aes(cat = species) +
  geom_lm_interaction() +
  geom_lm_interaction_formula() +
  geom_lm_interaction_fitted(color = "blue") +
  geom_lm_interaction_residuals(color = "red") +
  geom_lm_interaction_rsquared()
}
