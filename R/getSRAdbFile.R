getSRAdbFile <-
    function (destdir = getwd(), destfile = "SRAmetadb.sqlite.gz",
              method)
{
    if (missing(method))
        method <- ifelse(!is.null(getOption("download.file.method")),
                         getOption("download.file.method"), "auto")
    localfile <- file.path(destdir, destfile)   
    options(warn=-1)
    
    url_sra_1 = 'https://gbnci-abcc.ncifcrf.gov/backup/SRAmetadb.sqlite.gz'
    url_sra_2 = 'https://dl.dropboxusercontent.com/u/51653511/SRAmetadb.sqlite.gz'
    url_sra_3 = 'http://watson.nci.nih.gov/~zhujack/SRAmetadb.sqlite.gz'


    if(! inherits(try(url(url_sra_1, open='rb'), silent = TRUE), "try-error") ) {
       url_sra = url_sra_1
    } else if(! inherits(try(url(url_sra_2, open='rb'), silent = TRUE), "try-error") ) {
       url_sra = url_sra_2
    } else {
       url_sra = url_sra_3
    }

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
