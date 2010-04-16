getSRAdbFile <-
    function (destdir = getwd(), destfile = "SRAmetadb.sqlite.gz",
              method)
{
    if (missing(method))
        method <- ifelse(!is.null(getOption("download.file.method")),
                         getOption("download.file.method"), "auto")
    localfile <- file.path(destdir, destfile)
    
    options(warn=-1)
    url_sra = "http://watson.nci.nih.gov/~zhujack/SRAmetadb.sqlite.gz"
    con.url_sra <- try(url(url_sra, open='rb'), silent = TRUE)
    if(inherits(con.url_sra, "try-error"))
    	url_sra = "http://gbnci.abcc.ncifcrf.gov/backup/SRAmetadb.sqlite.gz"
    download.file(url_sra, destfile = localfile, mode = "wb", method=method)
	
    message("Unzipping...\n")
    gunzip(localfile, overwrite = TRUE)
    unzippedlocalfile <- gsub("[.]gz$", "", localfile)
    con <- dbConnect(SQLite(), unzippedlocalfile)
    dat <- dbGetQuery(con, "SELECT * FROM metaInfo")
    dbDisconnect(con)
    message("Metadata associate with downloaded file:\n")
    message(dat)
    return(unzippedlocalfile)
}
