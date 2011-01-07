getSRAfile <-
function (in_acc, sra_con, destdir, sraType='litesra', makeDirectory = FALSE, method) 
{
    if (missing(method))
        method <- ifelse(!is.null(getOption("download.file.method")),
                         getOption("download.file.method"), "auto")
	sraFiles = listSRAfile( in_acc, sra_con=sra_con, sraType )  
    if ( makeDirectory==TRUE && !file.exists(destdir) ) {
        tryCatch(dir.create( destdir ),
                 error=function(err) {
                     stop("failed to create '", destdir, "': ",
                          conditionMessage(err))
                 })
    }
 	message( "Files are saved to: \n'", destdir, "'\n" )
    fnames <- sraFiles$sra
    fileinfo = NULL
    for (i in fnames) {
        download.file(i, destfile = file.path(destdir, basename(i)),
                      method=method)
    }
}

