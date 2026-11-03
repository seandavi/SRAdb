colDescriptions <- function ( sra_con ) 
{
    .deprecatedSRAdb("colDescriptions")
    dat <- dbGetQuery(sra_con, "SELECT * FROM col_desc")
    return(dat)
}
