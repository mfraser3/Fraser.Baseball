Batting_Summary_By_Season <- function(FG_Constants) {

  Batting.Summary.By.Season <- Batting %>%
    group_by(playerID, yearID) %>%
    dplyr::summarise(across(.cols = c(4:20), sum, na.rm = FALSE)) %>%
    replace(is.na(.), 0) %>%
    left_join(People %>% dplyr::select(playerID, nameFirst, nameLast), by = "playerID") %>%
    relocate(nameFirst, .after = playerID) %>%
    relocate(nameLast, .after = nameFirst) %>%
    left_join(FG_Constants, by = "yearID") %>%
    left_join(People %>% dplyr::select(playerID, birthYear, birthMonth, birthDay), by = "playerID") %>%
    mutate(BaseballAge = ifelse(birthMonth < 7, (yearID - birthYear), (yearID - 1 - birthYear)),
           BA = ifelse(AB > 0, round(H/AB, 3), NA),
           PA = AB + BB + HBP + SH + SF,
           TB = H + `2B` + 2 * `3B` + 3 * HR, # NOTE: If you are using the Lahman R package, `2B` and `3B` should be renamed to `X2B` and `X3B`
           SLG = ifelse(AB > 0, round(TB/AB, 3), NA),
           OBP = ifelse(PA > 0,
                        round((H + BB + HBP)/(PA - SH), 3), NA),
           OPS = round(OBP + SLG, 3),
           BABIP = ifelse(AB > 0, round((H - HR)/(AB - SO - HR + SF), 3), NA),
           wOBA = (((wBB * (BB-IBB)) + (wHBP * HBP) + (w1B * (H - `2B` - `3B` - HR)) + (w2B * `2B`) + (w3B * `3B`) + (wHR * HR))/(AB + BB - IBB + SF + HBP)),
           wRAA = (((wOBA - league.wOBA)/wOBAScale)) * PA,
           wRC = (((wOBA - league.wOBA)/wOBAScale) + (RperPA)) * PA) %>%
    relocate(BaseballAge, .after = yearID) %>%
    relocate(birthYear, .after = nameLast) %>%
    relocate(birthMonth, .after = birthYear) %>%
    relocate(birthDay, .after = birthMonth)
}
