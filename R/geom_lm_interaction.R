compute_panel_ols_int <- function(data, scales) {

  model <- lm(y ~ x*indicator,
              data = data)

  data.frame(x = data$x,
             y = model$fitted.values,
             indicator = data$indicator,
             xend = data$x,
             yend = data$y)

}



StatLminteraction <- ggplot2::ggproto("StatLminteraction",
                                      ggplot2::Stat,
                                      compute_panel = compute_panel_ols_int,
                                      required_aes = c("x", "y", "indicator"),
                                      default_aes = ggplot2::aes(group = after_stat(indicator))
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
geom_lm_interaction <- function(mapping = NULL, data = NULL,
                                position = "identity", na.rm = FALSE,
                                show.legend = NA,
                                inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = StatLminteraction, # proto object from Step 2
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
geom_lm_interaction_fitted <- function(mapping = NULL, data = NULL,
                                       position = "identity", na.rm = FALSE,
                                       show.legend = NA,
                                       inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = StatLminteraction, # proto object from Step 2
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
geom_lm_interaction_residuals <- function(mapping = NULL, data = NULL,
                                       position = "identity", na.rm = FALSE,
                                       show.legend = NA,
                                       inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = StatLminteraction, # proto object from Step 2
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
#'   aes(indicator = species) +
#'   geom_lm_interaction() +
#'   geom_lm_interaction_formula() +
#'   geom_lm_interaction_fitted(color = "blue") +
#'   geom_lm_interaction_residuals(color = "red") +
#'   geom_lm_interaction_rsquared()
geom_lm_interaction_residuals <- function(mapping = NULL, data = NULL,
                                       position = "identity", na.rm = FALSE,
                                       show.legend = NA,
                                       inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = StatLminteraction, # proto object from Step 2
    geom = ggplot2::GeomSegment, # inherit other behavior
    data = data,
    mapping = mapping,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, ...)
  )
}

