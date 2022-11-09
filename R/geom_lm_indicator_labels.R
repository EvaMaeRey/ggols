compute_panel_ols_ind_label <- function(data, scales) {

  model <- lm(y ~ x + indicator,
              data = data)

  data.frame(names = model[[1]] %>% names(),
             coeff = model[[1]]) %>%
    tibble::tibble() %>%
    dplyr::slice(-1, -2) %>%
    dplyr::mutate(equation = paste0(coeff %>% good_digits(), "*", names)) %>%
    dplyr::pull(equation) %>%
    paste(collapse = " + ") ->
    dummies


  data.frame(x = mean(data$x),
             y = mean(data$y),
             label = paste0("y = ",
                            model$coefficients[2] %>% good_digits(),
                            "x + ",
                            dummies,
                            " + ",
                            model$coefficients[1] %>%
                              good_digits()

             ) %>%
               stringr::str_wrap(50)

             )

}



StatOlsindformula <- ggplot2::ggproto("StatOlsindformula",
                                      ggplot2::Stat,
                                      compute_panel = compute_panel_ols_ind_label,
                                      required_aes = c("x", "y", "indicator")
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
geom_lm_indicator_formula <- function(mapping = NULL, data = NULL,
                                        position = "identity", na.rm = FALSE, show.legend = NA,
                                        inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = StatOlsindformula, geom = ggplot2::GeomLabel, data = data, mapping = mapping,
    position = position, show.legend = show.legend, inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, ...)
  )
}




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
#'   mutate(indicator = dist>15) %>%
#'   rename(x = speed, y = dist) %>%
#'   compute_panel_ols_ind_rsquared()
compute_panel_ols_ind_rsquared <- function(data, scales) {

  model <- lm(y ~ x + indicator,
              data = data)

  data.frame(x = mean(data$x),
             y = quantile(data$y, .8),
             label = summary(model)$r.squared %>%
               good_digits() %>% paste0("R-squared = ",.))

}

StatOlsindrsquared <- ggplot2::ggproto("StatOlsindrsquared",
                                      ggplot2::Stat,
                                      compute_panel = compute_panel_ols_ind_rsquared,
                                      required_aes = c("x", "y", "indicator")
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
geom_lm_indicator_rsquared <- function(mapping = NULL, data = NULL,
                                        position = "identity", na.rm = FALSE, show.legend = NA,
                                        inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = StatOlsindrsquared, geom = ggplot2::GeomLabel, data = data, mapping = mapping,
    position = position, show.legend = show.legend, inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, ...)
  )
}




