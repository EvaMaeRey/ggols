compute_panel_ols_ind <- function(data, scales, formula = y ~ x + cat) {

  model <- lm(formula = formula,
              data = data)

  data.frame(x = data$x,
             y = model$fitted.values,
             cat = data$cat,
             xend = data$x,
             yend = data$y)

}

StatLmcat <- ggplot2::ggproto("StatLmcat",
                                      ggplot2::Stat,
                                      compute_panel = compute_panel_ols_ind,

                                      required_aes = c("x", "y", "cat"),
                                      default_aes = ggplot2::aes(group = ggplot2::after_stat(cat))
)

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
#' ggplot(palmerpenguins::penguins) +
#'   aes(x = flipper_length_mm ) +
#'   aes(y = body_mass_g ) +
#'   geom_point() + aes(color = species) +
#'   aes(cat = species) +
#'   geom_lm_cat(formula = y ~ x + cat) +
#'   geom_lm_cat_formula() +
#'   geom_lm_cat_fitted(color = "blue") +
#'   geom_lm_cat_residuals(color = "red") +
#'   geom_lm_cat_rsquared()
#'
geom_lm_cat <- function(mapping = NULL, data = NULL,
                                position = "identity", na.rm = FALSE,
                                show.legend = NA,
                                inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = StatLmcat, # proto object from Step 2
    geom = ggplot2::GeomLine, # inherit other behavior
    data = data,
    mapping = mapping,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, ...)
  )
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
geom_lm_cat_fitted <- function(mapping = NULL, data = NULL,
                                       position = "identity", na.rm = FALSE,
                                       show.legend = NA,
                                       inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = StatLmcat, # proto object from Step 2
    geom = ggplot2::GeomPoint, # inherit other behavior
    data = data,
    mapping = mapping,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, ...)
  )
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
geom_lm_cat_residuals <- function(mapping = NULL, data = NULL,
                                       position = "identity", na.rm = FALSE,
                                       show.legend = NA,
                                       inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = StatLmcat, # proto object from Step 2
    geom = ggplot2::GeomSegment, # inherit other behavior
    data = data,
    mapping = mapping,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, ...)
  )
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
#'   geom_lm_cat(formula = y ~ x * cat) +
#'   geom_lm_cat_formula() +
#'   geom_lm_cat_fitted(color = "blue") +
#'   geom_lm_cat_residuals(color = "red") +
#'   geom_lm_cat_rsquared()
geom_lm_cat_residuals <- function(mapping = NULL, data = NULL,
                                       position = "identity", na.rm = FALSE,
                                       show.legend = NA,
                                       inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = StatLmcat, # proto object from Step 2
    geom = ggplot2::GeomSegment, # inherit other behavior
    data = data,
    mapping = mapping,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, ...)
  )
}

