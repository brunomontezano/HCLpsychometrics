
<!-- README.md is generated from README.Rmd. Please edit that file -->

# HCL-32 psychometric properties

<!-- badges: start -->

[![R-CMD-check](https://github.com/brunomontezano/HCLpsychometrics/workflows/R-CMD-check/badge.svg)](https://github.com/brunomontezano/HCLpsychometrics/actions)
<!-- badges: end -->

The objective of `HCLpsychometrics` is to provide functions to perform
the analyzes used in a study on the factor structure of the HCL-32
instrument in a population sample. The package has functions for
executing routines for confirmatory factor analysis and ordinal alpha
coefficient estimation.

#### Note

This repository is not intended to be used by others. It is a package
aggregating several tools used to replicate the specific analysis of an
article.

## Installation

The current version can be installed from [GitHub](https://github.com/)
with:

``` r
# install.packages("remotes")
remotes::install_github("brunomontezano/HCLpsychometrics")
```

## Examples

``` r
library(HCLpsychometrics)

# First, the models to be tested are created
created_models <- create_models()

# Then, we can fit these models on given dataset
# that contains yX as variable names, X being numbers from 1 to 32
fitted_models <- fit_models(
  data = hcl,
  models = created_models
)

# Finally, I could for example, summarize the parameters
# (In this case, I just printed the first 3 rows to save space)
summarize_parameters(
  fits = fitted_models
  ) %>% purrr::map(head, 3)
#> $bech
#>   Factor Item     B    SE     Z p.value  Beta
#> 1 active  y28 1.488 0.258 5.777       0 0.984
#> 2 active   y4 1.318 0.235 5.616       0 0.872
#> 3   risk  y23 1.000 0.000    NA      NA 0.851
#> 
#> $forty
#>   Factor Item     B    SE     Z p.value  Beta
#> 1 active  y28 2.143 0.556 3.852       0 0.947
#> 2 active  y19 1.962 0.513 3.828       0 0.867
#> 3 active  y17 1.928 0.496 3.890       0 0.852
#> 
#> $author
#>   Factor Item     B    SE     Z p.value  Beta
#> 1 active  y28 1.607 0.311 5.168       0 0.973
#> 2 active  y19 1.482 0.293 5.064       0 0.897
#> 3 active   y3 1.469 0.294 4.994       0 0.889
```
