#' ### one row per observation calculations
#' #' Title
#' #'
#' #' @param data
#' #' @param scales
#' #' @param formula
#' #'
#' #' @return
#' #' @export
#' #'
#' #' @examples
#' #' mtcars %>%
#' #' rename(y = mpg, x = wt, cat = am) %>%
#' #' compute_panel_augment
#' compute_panel_augment <- function(data, scales, formula = y ~ x + cat, method = lm) {
#'
#'   model <- method(formula = formula,
#'               data = data)
#'
#'   # broom::augment(model)
#'
#'   data.frame(x = data$x,
#'              xend = data$x,
#'              y = model$fitted.values,
#'              yend = data$y,
#'              cat = data$cat)
#'
#' }
#'
#' StatLmObs <- ggplot2::ggproto("StatLmObs",
#'                                     ggplot2::Stat,
#'                                     compute_panel = compute_panel_augment,
#'                                     required_aes = c("x", "cat"),
#'                                     default_aes = ggplot2::aes(group = ggplot2::after_stat(cat))
#' )
#'
#' stat_model_observations <- function(mapping = NULL, data = NULL,
#'                                     position = "identity", na.rm = FALSE, show.legend = NA,
#'                                     inherit.aes = TRUE, geom = ggplot2::GeomPoint , ...) {
#'   ggplot2::layer(
#'     stat = StatLmObs, geom = geom, data = data, mapping = mapping,
#'     position = position, show.legend = show.legend, inherit.aes = inherit.aes,
#'     params = list(na.rm = na.rm, ...)
#'   )
#' }
#'
#' geom_fitted <- function(...){stat_model_observations(...)}
#'
#' geom_residuals <- function(...){stat_model_observations(..., geom = ggplot2::GeomSegment)}
#'
#' ggplot(mtcars) +
#'   aes(mpg, wt, cat = am) +
#'   geom_point() +
#'   geom_fitted(color  = "blue") +
#'   geom_residuals()
#'
#' ggplot(mtcars) +
#'   aes(mpg, wt, cat = am) +
#'   geom_point() +
#'   geom_fitted(color  = "blue", formula = y ~ x + I(x^2) + cat ) +
#'   geom_residuals(formula = y ~ x ++ I(x^2) + cat)
#'
#'
#' ### one row per observation calculations
#' #' Title
#' #'
#' #' @param data
#' #' @param scales
#' #' @param formula
#' #'
#' #' @return
#' #' @export
#' #'
#' #' @examples
#' #' mtcars %>%
#' #' rename(y = mpg, x = wt, cat = am) %>%
#' #' compute_panel_glance() # model level summary
#' compute_panel_glance <- function(data, scales, formula = y ~ x + cat, method = lm) {
#'
#'   model <- method(formula = formula,
#'                   data = data)
#'
#'   broom::glance(model) %>%
#'     mutate(x = mean(data$x),
#'            y = mean(data$y),
#'            .before = 1)
#'
#' }
#'
#' StatLmSelf <- ggplot2::ggproto("StatLmSelf",
#'                               ggplot2::Stat,
#'                               compute_panel = compute_panel_glance,
#'                               required_aes = c("x", "cat"),
#'                               default_aes = ggplot2::aes(label = ggplot2::after_stat(r.squared) %>% round(3))
#' )
#'
#'
#' stat_model_self <- function(mapping = NULL, data = NULL,
#'                                     position = "identity", na.rm = FALSE, show.legend = NA,
#'                                     inherit.aes = TRUE, geom = ggplot2::GeomLabel , ...) {
#'   ggplot2::layer(
#'     stat = StatLmSelf, geom = geom, data = data, mapping = mapping,
#'     position = position, show.legend = show.legend, inherit.aes = inherit.aes,
#'     params = list(na.rm = na.rm, ...)
#'   )
#' }
#'
#' geom_model_rsquared <- function(...){stat_model_self(...)}
#' geom_model_adj_rsquared <- function(...){stat_model_self(aes(label = after_stat(round(adj.r.squared, 3))),...)}
#'
#' ggplot(mtcars) +
#'   aes(mpg, wt, cat = am) +
#'   geom_point() +
#'   geom_model_rsquared() +
#'   geom_model_adj_rsquared()
#'
#'
#' sequence_across_groups <- function(data){
#'
#'     seq80 <- function(from, to){seq(from = from, to = to , length.out = 80)}
#'   # seq80(1, 2)
#'
#'  data %>%
#'     group_by(cat) %>%
#'     summarise(mix_x_observed = min(x),
#'               max_x_observed = max(x)) %>%
#'     mutate(seq_x = purrr::map2(mix_x_observed, max_x_observed, .f = seq80)) %>%
#'    unnest(seq_x)
#'
#' }
#'
#' mtcars %>%
#'   remove_missing() %>%
#'   rename(x = wt, cat = am) %>%
#'   sequence_across_groups()
#'
#'
#'
#' compute_panel_across <- function(data, scales, formula = y ~ x + cat, method = lm) {
#'
#'   data %>%
#'     sequence_across_groups ->
#'   data
#'
#'   model <- method(formula = formula,
#'                   data = data)
#'
#'   predict(model, newdata = data) ->
#'     fitted_across
#'
#'
#'   predict(model, interval = "confidence")
#'
#'   predict(model, interal = "prediction")
#'
#'
#' }
#'
#' StatLmSelf <- ggplot2::ggproto("StatLmSelf",
#'                                ggplot2::Stat,
#'                                compute_panel = compute_panel_glance,
#'                                required_aes = c("x", "cat"),
#'                                default_aes = ggplot2::aes(label = ggplot2::after_stat(r.squared) %>% round(3))
#' )
#'
#'
#' mtcars %>%
#'   ggplot() +
#'   aes(x = )
#'
#' # spans_for_groups <-
#'
#' #
#' # # n rows per category calculations (or something like that)
#' # compute_panel_cat_prediction <- function(data, scales,
#' #                                          formula = y ~ x + cat,
#' #
#' #                                          level = .95,
#' #                                          num_breaks = 100) {
#' #
#' #   model <- lm(formula = formula,
#' #               data = data)
#' #
#' #   new_x_df <- seq(min(data$x), max(data$x),
#' #                   length.out = num_breaks) %>%
#' #     data.frame(x = .)
#' #
#' #   predict(model,
#' #           newdata = data,
#' #           interval = "confidence",
#' #           level = level
#' #   ) ->
#' #     predict_df
#' #
#' #   data.frame(x = data$x,
#' #              xend = data$x,
#' #              xmin = data$x,
#' #              xmax = data$x,
#' #              y = predict_df[,2],
#' #              yend = predict_df[,3],
#' #              ymin = predict_df[,2],
#' #              ymax = predict_df[,3],
#' #              alpha = .3,
#' #              cat = data$cat)
#' # }
#' #
#' #
#' #
#' # # summary calculations 1 row
#' # compute_panel_ols_cat_label <- function(data,
#' #                                         scales,
#' #                                         formula = y ~ x + cat) {
#' #
#' #   model <- lm(formula = formula,
#' #               data = data)
#' #
#' #   data.frame(names = model[[1]] %>% names(),
#' #              coeff = model[[1]]) %>%
#' #     tibble::tibble() %>%
#' #     dplyr::slice(-1, -2) %>%
#' #     dplyr::mutate(equation = paste0(coeff %>% good_digits(), "*", names)) %>%
#' #     dplyr::pull(equation) %>%
#' #     paste(collapse = " + ") ->
#' #     dummies
#' #
#' #
#' #   data.frame(x = mean(data$x),
#' #              y = mean(data$y),
#' #              label = paste0("y = ",
#' #                             model$coefficients[2] %>% good_digits(),
#' #                             "x + ",
#' #                             dummies,
#' #                             " + ",
#' #                             model$coefficients[1] %>%
#' #                               good_digits()
#' #
#' #              ) %>%
#' #                stringr::str_wrap(50)
#' #
#' #   )
#' #
#' # }
#' #
#' #
#' # compute_panel_ols_rsquared <- function(data, scales) {
#' #
#' #   model <- lm(y ~ x,
#' #               data = data)
#' #
#' #   data.frame(x = mean(data$x),
#' #              y = quantile(data$y, .8),
#' #              label = summary(model)$r.squared %>%
#' #                good_digits() %>%
#' #                paste0("R-squared = ", .))
#' #
#' # }
