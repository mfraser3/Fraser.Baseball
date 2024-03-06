Get_Park_Factors <- function(season) {

  Park_Factors <- read_html(paste0("https://www.fangraphs.com/guts.aspx?type=pf&teamid=0&season=", season))

  Park.Factors.List <- Park_Factors %>%
    html_nodes("table") %>%
    html_table()

  Park.Factors.Table <- Park.Factors.List[[9]]


  Park.Factors.Table

}
