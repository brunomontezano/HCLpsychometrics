#' Calculates Cronbach's alpha based on author's model
#'
#' @param data Dataset containing HCL-32 items.
#'
#' @return Cronbach's alpha coefficient calculated based on Pearson's correlation matrix in the full dataset, active factor and risk-taking factor.
#' @export
#'
alpha_authors_model <- function(data) {

  full <- data %>%
    dplyr::select(
      y2, y3, y4, y5, y6, y10, y11, y12, y13,
      y14, y15, y16, y17, y18, y19, y20, y21,
      y22, y24, y28, y8, y9, y25, y26, y27,
      y29, y30, y31, y32
    )

  active <- data %>%
    dplyr::select(
      y2, y3, y4, y5, y6,
      y10, y11, y12, y13,
      y15, y16, y17, y18,
      y19, y20, y21, y22,
      y24, y28
    )

  risk <- data %>%
    dplyr::select(
      y8, y9, y25, y26, y27,
      y29, y30, y31, y32
    )

  sets <- list(full, active, risk) %>%
    purrr::set_names("Full data", "Active factor", "Risk-taking factor")

  alphas <- purrr::map(sets,
    ~ psych::alpha(.x)) %>%
    purrr::map(purrr::pluck(1)) %>%
    purrr::map(~ as.numeric(as.vector(.x)[2]))

  return(alphas)

}
