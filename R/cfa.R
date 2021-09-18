#' Create three models that can be used to fit lavaan models for HCL-32
#'
#' @return A list with three models on lavaan package syntax.
#' @export
#'
create_models <- function() {

  bech <- 'active =~ y2 + y28 + y11 +
  y5 + y18 + y4 + y15 + y20 +
  y10 + y1
  risk =~ y23 + y8 + y9 + y25 +
  y21 + y31 + y29 + y7 + y27 + y32'

  forty <- 'active =~ y1 + y4 + y6 +
  y10 + y13 + y17 + y19 + y20 + y28
  risk =~ y8 + y9 + y14 + y27 +
  y30 + y31 + y32'

  author <- 'active =~ y2 + y3 + y4 +
  y5 + y6 + y10 + y11 + y12 + y13 + y15 +
  y16 + y17 + y18 + y19 + y20 +
  y21 + y22 + y24 + y28
  risk =~ y8 + y9 + y25 + y26 +
  y27 + y29 + y30 + y31 + y32'

  models <- list(bech, forty, author) %>%
    purrr::set_names(
      nm = c("bech", "forty", "author")
    )

  return(models)

}

#' Fit CFA models on given data using WLSMV estimator
#'
#' @param data Data frame or tibble containing the HCL-32 items.
#' @param models Models to be fitted on data.
#'
#' @return A list containing the fitted models.
#' @export
#'
fit_models <- function(data, models) {

  set.seed(666)

  fits <- purrr::map(models,
    ~ lavaan::cfa(.x,
      data = data,
      estimator = "WLSMV",
      ordered = names(data))
  )

  return(fits)

}

#' Summarize fitted models performance metrics
#'
#' @param fits A list containing fitted models.
#'
#' @return Summarized metrics for each model as a list. Based on lavaan output.
#' @export
#'
summarize_fit <- function(fits) {

  summaries <- purrr::map(fits,
    ~ lavaan::summary(.x,
      fit.measures = TRUE,
      standardized = TRUE)
  )

  return(summaries)

}


#' Summarize fitted models metrics
#'
#' @param fits A list containing fitted models.
#'
#' @return Summarized parameters for each model as a list. Based on lavaan output.
#' @export
#'
summarize_parameters <- function(fits) {

  tables <- purrr::map(
    fits,
    ~ lavaan::parameterEstimates(.x, standardized = TRUE) %>%
      dplyr::filter(op == "=~") %>%
      dplyr::select("Factor" = lhs,
        Item = rhs,
        B = est,
        SE = se,
        Z = z,
        "p-value" = pvalue,
        Beta = std.all)
  )

  return(tables)

}
