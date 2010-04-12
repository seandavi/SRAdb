getSRAdbFile <-
    function (destdir = getwd(), destfile = "SRAmetadb.sqlite.gz",
              method)
{
    if (missing(method))
        method <- ifelse(!is.null(getOption("download.file.method")),
                         getOption("download.file.method"), "auto")
    localfile <- file.path(destdir, destfile)
    download.file("http://watson.nci.nih.gov/~zhujack/SRAmetadb.sqlite.gz", 
                  destfile = localfile, mode = "wb", method=method)
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
