## GET LAHMAN DATA FOR SELECTED YEAR FOR SPECIFIC TABLES ##

get_Lahman <- function(yearID, table, path = "~/Nextcloud/Personal/Data/Baseball/Lahman/") { ## YEARID IS THE LATEST YEAR TO INCLUDE; TABLE IS THE DATASET OF INTEREST (e.g. Batting, Pitching, HallOfFame, etc)

  yearID <- yearID

  path <- paste0(path, yearID)

  df <- read_csv(paste0(path, "/", table, ".csv"))

}

