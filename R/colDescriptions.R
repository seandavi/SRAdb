colDescriptions <- function ( sra_con ) 
{
    dat <- dbGetQuery(sra_con, "SELECT * FROM col_desc")
    return(dat)
}
