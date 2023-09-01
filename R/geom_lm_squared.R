compute_group_ols_squared <- function(data, scales) {

  data$xsq = data$x^2

  model <- lm(y ~ x + xsq,
              data = data)

  data.frame(x = data$x,
             y = model$fitted.values,
             xend = data$x,
             yend = data$y)

}

StatLmsq <- ggplot2::ggproto("StatLmsq",
                                      ggplot2::Stat,
                                      compute_group = compute_group_ols_squared,
                                      required_aes = c("x", "y")#,
                                      # default_aes = ggplot2::aes(group = ggplot2::after_stat(paste(cat, cat2)))
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
#' library(ggplot2)
#' ggplot(cars) +
#' aes(x = speed, y = dist) +
#' geom_point() +
#' geom_lm_square()
geom_lm_square <- function(mapping = NULL, data = NULL,
                                position = "identity", na.rm = FALSE,
                                show.legend = NA,
                                inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = StatLmsq, # proto object from Step 2
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
geom_lm_squared_fitted <- function(mapping = NULL, data = NULL,
                                       position = "identity", na.rm = FALSE,
                                       show.legend = NA,
                                       inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = StatLmcat2, # proto object from Step 2
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
geom_lm_cat2_residuals <- function(mapping = NULL, data = NULL,
                                       position = "identity", na.rm = FALSE,
                                       show.legend = NA,
                                       inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = StatLmcat2, # proto object from Step 2
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
#'   geom_lm_cat() +
#'   geom_lm_cat_formula() +
#'   geom_lm_cat_fitted(color = "blue") +
#'   geom_lm_cat_residuals(color = "red") +
#'   geom_lm_cat_rsquared()
geom_lm_cat2_residuals <- function(mapping = NULL, data = NULL,
                                       position = "identity", na.rm = FALSE,
                                       show.legend = NA,
                                       inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = StatLmcat2, # proto object from Step 2
    geom = ggplot2::GeomSegment, # inherit other behavior
    data = data,
    mapping = mapping,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, ...)
  )
}

