
<!-- README.md is generated from README.Rmd. Please edit that file -->

# HCL-32 Psychometric Properties <a href='https://github.com/brunomontezano/HCLpsychometrics/'><img src='man/figures/logo.png' align="right" height="139" /></a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/brunomontezano/HCLpsychometrics/workflows/R-CMD-check/badge.svg)](https://github.com/brunomontezano/HCLpsychometrics/actions)
<!-- badges: end -->

The objective of `HCLpsychometrics` is to provide functions to perform
the analyzes used in a study on the factor structure of the HCL-32
instrument in a population sample. The package has functions for
executing routines for confirmatory factor analysis and Cronbach’s alpha
coefficient estimation.

#### Note

This repository is not intended to be used by others. It is a package
aggregating several tools used to replicate the specific analysis of an
article. The dataset named `hcl` inside the package contains an example
tibble (10% of the original sample) to check the proper functioning and
give an idea on how the package works.

## Installation

The current version can be installed from [GitHub](https://github.com/)
with:

``` r
# install.packages("remotes")
remotes::install_github("brunomontezano/HCLpsychometrics")
```

## Examples

### Confirmatory Factor Analysis

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
#> $Bech
#>   Factor Item     B    SE     Z p.value  Beta
#> 1 Active  y28 1.488 0.258 5.777       0 0.984
#> 2 Active   y4 1.318 0.235 5.616       0 0.872
#> 3   Risk  y23 1.000 0.000    NA      NA 0.851
#> 
#> $Forty
#>   Factor Item     B    SE     Z p.value  Beta
#> 1 Active  y28 2.143 0.556 3.852       0 0.947
#> 2 Active  y19 1.962 0.513 3.828       0 0.867
#> 3 Active  y17 1.928 0.496 3.890       0 0.852
#> 
#> $`HCL-28`
#>   Factor Item     B    SE     Z p.value  Beta
#> 1 Active  y28 1.564 0.289 5.415       0 0.985
#> 2 Active  y19 1.432 0.269 5.330       0 0.902
#> 3 Active   y3 1.416 0.269 5.261       0 0.891
```

As can be seen from the output of the functions, they work in order to
fit three models for CFA: a model by Bech et al. (2011), another by
Forty et al. (2010) and a third model called HCL-28, developed by the
authors of the paper.

Note that the `summarize_fit` and `summarize_parameters` functions’
outputs are returned as an R list, facilitating the individual check of
the results of each model through the elements in this list.

### Cronbach’s Alpha

``` r
# The alpha_hcl28 function can be used to calculate Cronbach's
# alpha based on the HCL-28 model in the input dataset
HCLpsychometrics::alpha_hcl28(hcl)
#> $`HCL-28`
#> [1] 0.8821557
#> 
#> $`Active factor`
#> [1] 0.9055125
#> 
#> $`Risk-taking factor`
#> [1] 0.6307153
```

As you can see from the output, the `alpha_hcl28` function generates
Cronbach’s alpha for the structure (HCL-28) as a whole, and separately
by factor.

## Acknowledgement

I would like to thank designer [Guilherme
Bueno](https://guilhermebuenodesign.github.io/) for creating the
repository logo.

Logo icon adapted from [Freepik](https://www.freepik.com/).

## Contact

Feel free to contact me here on
[GitHub](https://github.com/brunomontezano) or
[ResearchGate](https://www.researchgate.net/profile/Bruno-Braga-Montezano).
