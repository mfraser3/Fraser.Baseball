## GET LAHMAN DATA FOR SELECTED YEAR FOR SPECIFIC TABLES ##

get_Lahman <- function(yearID, table) { ## YEARID IS THE LATEST YEAR TO INCLUDE; TABLE IS THE DATASET OF INTEREST (e.g. Batting, Pitching, HallOfFame, etc)

  yearID <- yearID

  path <- paste0("~/Nextcloud/Personal/Data/Baseball/Lahman/", yearID)

  df <- read_csv(paste0(path, "/", table, ".csv"))

}
