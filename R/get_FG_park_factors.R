get_fg_park_factors <- function(yr.start, yr.end) {
    
    n <- lubridate::year(Sys.Date()) - 1871
    datalist <- vector("list", length = n) 
    
    for(i in yr.start:yr.end) {
        dat <- fg_park(i)
        datalist[[i]] <- dat
        
    }
    
    park_factors <- do.call(rbind, datalist)
}