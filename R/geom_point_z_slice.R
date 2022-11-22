compute_panel_z_slice <- function(data, scales, quantile = .5, tolerance = .05) {

  upper = quantile(data$z, quantile + tolerance)
  lower = quantile(data$z, quantile - tolerance)

  data %>%
    filter(z < upper &
          z > lower)

}



StatPointzslice <- ggplot2::ggproto("StatPointzslice",
                            ggplot2::Stat,
                            compute_panel = compute_panel_z_slice,
                            required_aes = c("x", "y", "z")
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
#' library(tidyverse)
#' ggplot(palmerpenguins::penguins) +
#' aes(x = bill_length_mm, y = bill_depth_mm, z = flipper_length_mm) +
#' geom_lm_z(quantile = .6) +
#' geom_point_z_slice(quantile = .6) +
#' geom_point(alpha = .2)
geom_point_z_slice <- function(mapping = NULL, data = NULL,
                                position = "identity", na.rm = FALSE,
                                show.legend = NA,
                                inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = StatPointzslice, # proto object from Step 2
    geom = ggplot2::GeomPoint, # inherit other behavior
    data = data,
    mapping = mapping,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, ...)
  )
}



compute_panel_z_chunk <- function(data, scales, quantile = .5) {

  lower = quantile(data$z, quantile)

  data %>%
    filter(z < lower)

}



StatPointzchunk <- ggplot2::ggproto("StatPointzchunk",
                                    ggplot2::Stat,
                                    compute_panel = compute_panel_z_chunk,
                                    required_aes = c("x", "y", "z")
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
#' library(tidyverse)
#' ggplot(palmerpenguins::penguins) +
#' aes(x = bill_length_mm, y = bill_depth_mm, z = flipper_length_mm) +
#' geom_lm_z(quantile = .6) +
#' geom_point_z_chunk(quantile = .6, alpha = .1) +
#' geom_point_z_slice(quantile = .6) +
#' geom_point(alpha = .05)
geom_point_z_chunk <- function(mapping = NULL, data = NULL,
                               position = "identity", na.rm = FALSE,
                               show.legend = NA,
                               inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = StatPointzchunk, # proto object from Step 2
    geom = ggplot2::GeomPoint, # inherit other behavior
    data = data,
    mapping = mapping,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, ...)
  )
}



