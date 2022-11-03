#### confint #####
StatOlsconfintint <- ggplot2::ggproto("StatOlsconfintint",
                                      ggplot2::Stat,
                                      compute_panel = function(data, scales,
                                                               level = .95,
                                                               num_breaks = 100) {

                                        model <- lm(y ~ x * indicator,
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
                                                   indicator = data$indicator)
                                      },

                                      required_aes = c("x", "y", "indicator"),
                                      default_aes = ggplot2::aes(group = ggplot2::after_stat(indicator))
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
#' ggplot(cars) + aes(x = speed, y = dist, indicator = dist > 40) +
#' geom_point() + geom_lm_interaction() + geom_lm_interaction_conf_int(level = .8)
geom_lm_interaction_conf_int <- function(mapping = NULL, data = NULL,
                                       position = "identity", na.rm = FALSE, show.legend = NA,
                                       inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = StatOlsconfintint, geom = ggplot2::GeomRibbon, data = data, mapping = mapping,
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
#' mutate(indicator = dist > 50) %>%
#'   rename(x = speed,
#'          y = dist) %>%
#'   compute_panel_interaction_intercept()
compute_panel_interaction_intercept <- function(data, scales) {

  model <- lm(y ~ x * indicator,
              data = data)

  new_x_df <- data.frame(indicator =
                           unique(data$indicator),
                         x = 0)
  predict(model,
          newdata = new_x_df,
          interval = "none"
  ) %>%
    data.frame(y = .,
               x = 0,
               indicator = unique(data$indicator)) %>%
    mutate(label = paste0("(0, ", y %>% good_digits(),")" ))


}

StatOlsinterceptint <- ggplot2::ggproto("StatOlsinterceptint",
                                        ggplot2::Stat,
                                        compute_panel = compute_panel_interaction_intercept,
                                        required_aes = c("x", "y", "indicator"),
                                        default_aes = ggplot2::aes(group = after_stat(indicator))
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
#' aes(x = speed, y = dist, indicator = dist > 30,
#' color = dist > 30) +
#' geom_point() +
#' geom_lm_interaction() +
#' geom_lm_interaction_intercept(color = "blue") +
#' geom_lm_interaction_intercept_label(hjust = -.2) +
#' geom_lm_interaction_conf_int() +
#' geom_lm_interaction_residuals() +
#' geom_lm_interaction_fitted() +
#' geom_lm_interaction_formula() +
#' geom_lm_interaction_rsquared()
geom_lm_interaction_intercept <- function(mapping = NULL, data = NULL,
                                        position = "identity", na.rm = FALSE, show.legend = NA,
                                        inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = StatOlsinterceptint, geom = ggplot2::GeomPoint, data = data, mapping = mapping,
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
geom_lm_interaction_intercept_label <- function(mapping = NULL, data = NULL,
                                              position = "identity", na.rm = FALSE, show.legend = NA,
                                              inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = StatOlsinterceptint, geom = ggplot2::GeomText, data = data, mapping = mapping,
    position = position, show.legend = show.legend, inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, ...)
  )
}
