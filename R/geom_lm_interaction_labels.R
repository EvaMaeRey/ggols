


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
geom_lm_interaction_formula <- function(mapping = NULL, data = NULL,
                                        position = "identity", na.rm = FALSE, show.legend = NA,
                                        inherit.aes = TRUE, ...) {
  geom_lm_cat_formula(formula = y ~ x*cat,
                              mapping = mapping,
                              data = data,
                              position = "identity",
                              na.rm = na.rm,
                              show.legend = show.legend,
                              inherit.aes = inherit.aes, ...)

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
geom_lm_interaction_rsquared <- function(mapping = NULL, data = NULL,
                                        position = "identity", na.rm = FALSE, show.legend = NA,
                                        inherit.aes = TRUE, ...) {
  geom_lm_cat_rsquared(formula = y ~ x*cat,
                            mapping = mapping,
                            data = data,
                            position = "identity",
                            na.rm = na.rm,
                            show.legend = show.legend,
                            inherit.aes = inherit.aes, ...)

}




