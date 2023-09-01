#' Title
#'
#' @param mapping
#' @param data
#' @param position
#' @param na.rm
#' @param show.legend
#' @param inherit.aes
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
geom_lm_interaction <- function(mapping = NULL, data = NULL,
                                position = "identity", na.rm = FALSE,
                                show.legend = NA,
                                inherit.aes = TRUE, ...) {
  geom_lm_cat(formula = y ~ x*cat,
                           mapping = mapping,
                           data = data,
                           position = "identity",
                           na.rm = na.rm,
                           show.legend = show.legend,
                           inherit.aes = inherit.aes, ...)
}


#' Title
#'
#' @param mapping
#' @param data
#' @param position
#' @param na.rm
#' @param show.legend
#' @param inherit.aes
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
geom_lm_interaction_fitted <- function(mapping = NULL, data = NULL,
                                       position = "identity", na.rm = FALSE,
                                       show.legend = NA,
                                       inherit.aes = TRUE, ...) {
  geom_lm_cat_fitted(formula = y ~ x*cat,
                              mapping = mapping,
                              data = data,
                              position = "identity",
                              na.rm = na.rm,
                              show.legend = show.legend,
                              inherit.aes = inherit.aes, ...)
}


#' Title
#'
#' @param mapping
#' @param data
#' @param position
#' @param na.rm
#' @param show.legend
#' @param inherit.aes
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(palmerpenguins::penguins) +
#'   aes(x = flipper_length_mm ) +
#'   aes(y = body_mass_g ) +
#'   geom_point() + aes(color = species) +
#'   aes(cat = species) +
#'   geom_lm_interaction() +
#'   geom_lm_interaction_formula() +
#'   geom_lm_interaction_fitted(color = "blue") +
#'   geom_lm_interaction_residuals(color = "red") +
#'   geom_lm_interaction_rsquared()
geom_lm_interaction_residuals <- function(mapping = NULL, data = NULL,
                                       position = "identity", na.rm = FALSE,
                                       show.legend = NA,
                                       inherit.aes = TRUE, ...) {

geom_lm_cat_residuals(formula = y ~ x*cat,
                            mapping = mapping,
                            data = data,
                            position = "identity",
                            na.rm = na.rm,
                            show.legend = show.legend,
                            inherit.aes = inherit.aes, ...)

}

