Batting_Summary_By_Career <- function() {

  Batting.Summary.By.Career <- Batting %>%
    group_by(playerID) %>%
    dplyr::summarise(across(.cols = c(5:21), sum, na.rm = FALSE),
                     BA = ifelse(AB > 0, round(H/AB, 3), NA),
                     PA = AB + BB + HBP + SH + SF,
                     TB = H + `2B` + 2 * `3B` + 3 * HR,
                     SLG = ifelse(AB > 0, round(TB/AB, 3), NA),
                     OBP = ifelse(PA > 0,
                                  round((H + BB + HBP)/(PA - SH), 3), NA),
                     OPS = round(OBP + SLG, 3),
                     BABIP = ifelse(AB > 0, round((H - HR)/(AB - SO - HR + SF), 3), NA)) %>%
    replace(is.na(.), 0) %>%
    left_join(People %>% dplyr::select(playerID, nameFirst, nameLast), by = "playerID") %>%
    relocate(nameFirst, .after = playerID) %>%
    relocate(nameLast, .after = nameFirst)
}
