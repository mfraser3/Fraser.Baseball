calculate_wRC_plus <- function(batting_summary, player, season, park_factor, lgwRC, PA_excluding_pitchers) {

  data <- batting_summary %>%
    dplyr::filter(playerID == player,
                  yearID == season) %>%
    mutate(`wRC+` = (((((wOBA - league.wOBA)/wOBAScale) + RperPA) + (RperPA - (park_factor * RperPA)))/((lgwRC)/PA_excluding_pitchers)) * 100)


}
