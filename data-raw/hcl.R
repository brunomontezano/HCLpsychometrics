raw <- haven::read_spss(
  file = "data-raw/banco-suelen-coorte-t1-t2.sav"
)

set.seed(666)

hcl <- raw %>%
  janitor::clean_names() %>%
  dplyr::select(
    dplyr::starts_with("hcl3")
  ) %>%
  tidyr::drop_na() %>%
  dplyr::mutate(
    dplyr::across(dplyr::everything(),
      ~ ifelse(.x > 1, NA, .x))
  ) %>%
  dplyr::rename_with(
    ~ stringr::str_replace_all(
      stringr::str_remove_all(string = .x, pattern = "_t1"), "hcl3", "y"
    )
  ) %>%
  dplyr::sample_frac(size = 0.1)

usethis::use_data(hcl, overwrite = TRUE)
