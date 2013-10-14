## getSRAfile is to download .sra or .lite.sra from NCBI or fastq files from EBI ENA ftp site for a given list of SRA accessions
## ascpCMD = 'ascp -QT -l 300m -i /usr/local/aspera/connect/etc/asperaweb_id_dsa.putty'

## Example: sraFiles = getSRAfile (c("SRR000648","SRR000657"), sra_con, destDir=getwd(), fileType='litesra', srcType='fasp', makeDirectory=FALSE, method='curl', ascpCMD=ascpCMD) 

getSRAfile <-
function (in_acc, sra_con, destDir=getwd(), fileType='litesra', srcType='ftp', makeDirectory=FALSE, method='curl', ascpCMD=NULL) 
{
	sraFiles = listSRAfile (in_acc, sra_con, fileType, srcType)
	
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

