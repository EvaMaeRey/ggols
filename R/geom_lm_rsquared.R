
#' Title
#'
#' @param data
#' @param scales
#'
#' @return
#' @export
#'
#' @examples
#' ###### R-squared
#' library(tidyverse)
#' cars %>%
#'   mutate(cat = dist>15) %>%
#'   rename(x = speed, y = dist) %>%
#'   compute_panel_ols_cat_rsquared()
compute_panel_ols_rsquared <- function(data, scales) {

  model <- lm(y ~ x,
              data = data)

  data.frame(x = mean(data$x),
             y = quantile(data$y, .8),
             label = summary(model)$r.squared %>%
               good_digits() %>% paste0("R-squared = ",.))

}

StatOlsrsquared <- ggplot2::ggproto("StatOlsrsquared",
                                      ggplot2::Stat,
                                      compute_panel = compute_panel_ols_rsquared,
                                      required_aes = c("x", "y")
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
#'
#' @examples
geom_lm_rsquared <- function(mapping = NULL, data = NULL,
                                        position = "identity", na.rm = FALSE, show.legend = NA,
                                        inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = StatOlsrsquared,
    geom = ggplot2::GeomLabel,
    data = data,
    mapping = mapping,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, ...)
  )
}




