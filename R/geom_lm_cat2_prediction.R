#### confint #####
StatOlsconfintind2 <- ggplot2::ggproto("StatOlsconfintind2",
                                   ggplot2::Stat,
                                   compute_panel = function(data, scales,
                                                            level = .95,
                                                            num_breaks = 100) {

                                     model <- lm(y ~ x + cat + cat2,
                                                 data = data)

                                     new_x_df <- seq(min(data$x), max(data$x),
                                                     length.out = num_breaks) %>%
                                       data.frame(x = .)

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
                                                y = predict_df[,2],
                                                yend = predict_df[,3],
                                                ymin = predict_df[,2],
                                                ymax = predict_df[,3],
                                                alpha = .3,
                                                cat = data$cat,
                                                cat2 = data$cat2)
                                   },

                                   required_aes = c("x", "y", "cat"),
                                   default_aes = ggplot2::aes(group = ggplot2::after_stat(paste(cat, cat2)))
)


#' Drawing prediction interval for OLS linear model
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
#' ggplot(cars) + aes(x = speed, y = dist, cat = dist > 40) +
#' geom_point() + geom_lm_cat() + geom_lm_cat_conf_int(level = .8)
geom_lm_cat2_conf_int <- function(mapping = NULL, data = NULL,
                             position = "identity", na.rm = FALSE, show.legend = NA,
                             inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = StatOlsconfintind2, geom = ggplot2::GeomRibbon, data = data, mapping = mapping,
    position = position, show.legend = show.legend, inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, ...)
  )
}



## Intercept  ####



#' Title
#'
#' @param data
#' @param scales
#'
#' @return
#' @export
#'
#' @examples
#' library(tidyverse)
#' cars %>%
#' mutate(cat = dist > 50) %>%
#'   rename(x = speed,
#'          y = dist) %>%
#'   compute_panel_cat_intercept()
compute_panel_cat2_intercept <- function(data, scales) {

  model <- lm(y ~ x + cat + cat2,
              data = data)

  new_x_df <- data.frame(cat =
                           unique(data$cat)) %>%
              crossing(cat2 = unique(data$cat2)) %>%
                         mutate(x = 0)
  predict(model,
          newdata = new_x_df,
          interval = "none"
  ) %>%
    data.frame(y = .,
               x = 0,
               cat = unique(data$cat)) %>%
    mutate(label = paste0("(0, ", y %>% good_digits(),")" ))


}

StatOlsinterceptind2 <- ggplot2::ggproto("StatOlsinterceptind",
                                      ggplot2::Stat,
                                      compute_panel = compute_panel_cat2_intercept,
                                      required_aes = c("x", "y", "cat"),
                                      default_aes = ggplot2::aes(group = after_stat(paste(cat)))
)



#' Intercept
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
#' aes(x = speed, y = dist, cat = dist > 30,
#' color = dist > 30) +
#' geom_point() +
#' geom_lm_cat() +
#' geom_lm_cat_intercept(color = "blue") +
#' geom_lm_cat_intercept_label(hjust = -.2) +
#' geom_lm_cat_conf_int() +
#' geom_lm_cat_residuals() +
#' geom_lm_cat_fitted() +
#' geom_lm_cat_formula() +
#' geom_lm_cat_rsquared()
geom_lm_cat2_intercept <- function(mapping = NULL, data = NULL,
                              position = "identity", na.rm = FALSE, show.legend = NA,
                              inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = StatOlsinterceptind2, geom = ggplot2::GeomPoint, data = data, mapping = mapping,
    position = position, show.legend = show.legend, inherit.aes = inherit.aes,
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
geom_lm_cat2_intercept_label <- function(mapping = NULL, data = NULL,
                                        position = "identity", na.rm = FALSE, show.legend = NA,
                                        inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = StatOlsinterceptind2, geom = ggplot2::GeomText, data = data, mapping = mapping,
    position = position, show.legend = show.legend, inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, ...)
  )
}
