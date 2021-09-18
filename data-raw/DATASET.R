## code to prepare `DATASET` dataset goes here
raw <- haven::read_spss(
  file = "data-raw/banco-suelen-coorte-t1-t2.sav"
)

DATASET <- raw %>%
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
  )

usethis::use_data(DATASET, overwrite = TRUE)
