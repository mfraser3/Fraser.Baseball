
Get_FG_Constants <- function() {

  FG.Constants <- read_html("https://www.fangraphs.com/guts.aspx?type=cn")

  FG.Constants.List <- FG.Constants %>%
    html_nodes("table") %>%
    html_table()

  FG.Constants.Table <- FG.Constants.List[[7]]
  colnames(FG.Constants.Table)[2] <- "league.wOBA"
  colnames(FG.Constants.Table)[1] <- "yearID"
  colnames(FG.Constants.Table)[12] <- "RperPA"

  FG.Constants.Table

}

