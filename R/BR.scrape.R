# Scrape data from baseball-reference.com

## Batter career scrape

br.get.batter.basic.career <- function(playerID) {
    
    url <- paste0("https://www.baseball-reference.com/players/", substr(playerID,1,1),"/", playerID, ".shtml")
    
    content <- read_html(url)
    tables <- content %>% html_table(fill = TRUE)
    df <- tables[[1]]
    df$Year <- as.numeric(df$Year)
    df <- df %>% filter(!is.na(Year)) %>% filter(Lg == "AL" | Lg == "NL")
}

## Batter home runs scrape

br.get.batter.homeruns <- function(playerID) {
    
    url <- paste0("https://www.baseball-reference.com/players/event_hr.fcgi?id=", playerID, "&amp;t=b")
    
    content <- read_html(url)
    tables <- content %>% html_table(fill = TRUE)
    ifelse(length(tables) == 18, names(tables) <- c("Teams", "Platoon", "Home/Road", "Outs", "Opponent", "Pitcher", "Parks", "Location",
                                                    "Game Totals", "Bases", "Inning", "Relative Score", "Count", "Defensive Position", 
                                                    "Order Position", "Leverage", "Play by Play"),
           names(tables) <- c("Teams", "Platoon", "Home/Road", "Outs", "Opponent", "Pitcher", "Parks", "Location",
                              "Game Totals", "Bases", "Inning", "Relative Score", "Defensive Position", 
                              "Order Position", "Leverage", "Play by Play"))
    return(tables)
    
}

## Batter WAR scrape (updated nightly)

br.get.batter.war <- function() {
    
    url <- "https://www.baseball-reference.com/data/war_daily_bat.txt"
    df <- read_csv(file = url)
    return(df)
}

## Pitcher WAR scrape (updated nightly)

br.get.pitcher.war <- function() {
    
    url <- "https://www.baseball-reference.com/data/war_daily_pitch.txt"
    df <- read_csv(file = url)
    return(df)
}

