Open_FanGraphs_Season_Tables <- function(season, League) {

  ### THIS FUNCTION HAS A VERY SIMPLE ROLE: TO OPEN A FANGRAPHS URL TO ACCESS DATA NEEDED TO CALCULATE wRC+

 browseURL(paste0("https://www.fangraphs.com/leaders.aspx?pos=np&stats=bat&lg=", League, "&qual=0&type=0&season=", season,"&month=0&season1=", season, "&ind=0&team=0,ss&rost=0&age=0&filter=&players=0&startdate=", season,"-01-01&enddate=", season, "-12-31"))

}




