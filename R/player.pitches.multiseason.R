player.pitches.multiseason <- function(name, firstseason, lastseason) {

  retrosheet_db <- dbConnect(RMariaDB::MariaDB(),
                             dbname = 'retrosheet_db',
                             host='Homer',
                             user='michaelfraser',
                             password = key_get("DBPassword"))

  mlbid <- as.numeric(dbGetQuery(conn = retrosheet_db,
                                 paste0("SELECT MLBID FROM playerids WHERE PLAYERNAME ='", name,"'")))

  table <- dbGetQuery(conn = retrosheet_db,
                      paste0("SELECT * FROM pitchcast WHERE batter ='", mlbid,"' AND game_year >='", firstseason," AND game_year <=", lastseason,"'"))


}
