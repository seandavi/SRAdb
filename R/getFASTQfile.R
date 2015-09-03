## getFASTQfile is to download Fastq information from ebi ftp site
## in_acc: can be one or more these types: study,sample, experiment, run

## ftp example:
# ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR392/SRR392120/SRR392120.fastq.gz

# getFASTQfile ( in_acc = c("SRR000648","SRR000657"), sra_con, destDir = getwd(), srcType='ftp', makeDirectory=FALSE, method='curl', ascpCMD )

getFASTQfile <-
function (in_acc, sra_con, destDir=getwd(), srcType='ftp', makeDirectory=FALSE, method='curl', ascpCMD=NULL) 
{	
	sraFiles = getFASTQinfo( in_acc, sra_con, srcType ) 
	
	if ( makeDirectory==TRUE && !file.exists(destDir) ) {
	    tryCatch(dir.create( destDir ),
	             error=function(err) {
	                 stop("failed to create '", destDir, "': ",
	                      conditionMessage(err))
	             })
	}
	message( "Files are saved to: \n'", destDir, "'\n" )
	
	if (srcType=='ftp') {
		if (missing(method))
		    method <- ifelse(!is.null(getOption("download.file.method")),
		                     getOption("download.file.method"), "auto")	
	
		fnames <- sraFiles$ftp
		fileinfo = NULL
		for (i in fnames) {
		    download.file(i, destfile = file.path(destDir, basename(i)),
		                  method=method)
		}
	} else if (srcType=='fasp'  & !is.null(ascpCMD)) {		
		ascpR (ascpCMD, sraFiles$fasp, destDir)	
	}
     return(sraFiles)	
}

