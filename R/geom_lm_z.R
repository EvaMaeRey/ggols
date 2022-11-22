compute_panel_ols_z <- function(data, scales, quantile = .5, level = .95) {

  model <- lm(y ~ x + z,
              data = data)


  data$z <- quantile(data$z, quantile)

  predict(model,
          newdata = data,
          interval = "confidence",
          level = level
  ) ->
    predict_df


  data.frame(x = data$x,
             xend = data$x,
             xmin = data$x,
             xmax = data$x,
             y = predict_df[,1],
             yend = predict_df[,3],
             ymin = predict_df[,2],
             ymax = predict_df[,3],
             alpha = .3,
             z = data$z)
}



StatLmz <- ggplot2::ggproto("StatLmz",
                                      ggplot2::Stat,
                                      compute_panel = compute_panel_ols_z,
                                      required_aes = c("x", "y", "z"),
                            default_aes = ggplot2::aes(group = ggplot2::after_stat(z))
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
#' ggplot(palmerpenguins::penguins) +
#' aes(x = bill_length_mm, y = bill_depth_mm, z = flipper_length_mm) +
#' geom_point() +
#' geom_lm_z(quantile = .5) +
#' geom_lm_z(quantile = .75) +
#' geom_lm_z(quantile = .25)
geom_lm_z <- function(mapping = NULL, data = NULL,
                                position = "identity", na.rm = FALSE,
                                show.legend = NA,
                                inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = StatLmz, # proto object from Step 2
    geom = ggplot2::GeomLine, # inherit other behavior
    data = data,
    mapping = mapping,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, ...)
  )
}


