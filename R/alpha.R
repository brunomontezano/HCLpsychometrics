#' Calculates ordinal alpha
#'
#' @param data Dataset containing HCL-32 items.
#'
#' @return Ordinal alpha coefficient calculated based on tetrachoric correlation matrix.
#' @export
#'
ord_alpha <- function(data) {

  ordinal_alpha <- psych::alpha(
    psych::tetrachoric(data)$rho
  )

  return(ordinal_alpha)

}
