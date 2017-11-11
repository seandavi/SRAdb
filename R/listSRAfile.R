## listSRAfile is to list ftp addresses or ascp sources of sra files
## options for fileType: 'sra', 'fastq'
## srcType: 'ftp' or 'fasp' 

## ftp example:
# ftp://ftp-trace.ncbi.nlm.nih.gov/sra/sra-instant/reads/ByRun/sra/SRR/SRR089/SRR089790/SRR089790.sra

## fasp example:
#  anonftp@ftp-trace.ncbi.nlm.nih.gov:/sra/sra-instant/reads/ByRun/sra/SRR/SRR089/SRR089790/SRR089790.sra
# listSRAfile (in_acc=c("SRX000122"), sra_con=sra_con, fileType='fastq', srcType='fasp')

listSRAfile <-
function( in_acc, sra_con, fileType='sra', srcType='ftp' ) {
	## note: 'litesra' has phased out 
	if( fileType == 'fastq' ) {
		sra_acc = sraConvert( in_acc, out_type=c('run'), sra_con = sra_con )
		sraFiles = getFASTQinfo (sra_acc$run, sra_con, srcType)
	} else if (fileType == 'sra') {
		sraExt <- '.sra'
		sra_acc  <- sraConvert (in_acc, out_type = c('study','sample','experiment','run'),
	                            sra_con= sra_con)	
		
		if (srcType == 'fasp') {
			srcMain = 'anonftp@ftp-trace.ncbi.nlm.nih.gov:'
		} else if (srcType == 'ftp') {
			srcMain = 'ftp://ftp-trace.ncbi.nlm.nih.gov'
		}
		
		sraFiles_1=NULL
		for( i in 1:nrow(sra_acc) ) {			
			sraFileDir<- paste(srcMain, '/sra/sra-instant/reads/ByRun/', fileType, 
					'/',
					substring(sra_acc$run[i], 1, 3), '/',
					substring(sra_acc$run[i], 1, 6), '/',
					sra_acc$run[i], '/',
					sep='')
				
			if ( is.na(sra_acc$run[i]) ) {
				sraFiles1 <- NA
			} else {
				sraFiles1 <- paste(sraFileDir, sra_acc$run[i] , sraExt, sep='')			
			}
			sraFiles_1=c(sraFiles_1, sraFiles1)
	 	}
		
		sraFiles <- cbind(sra_acc, sraFiles_1, stringsAsFactors=FALSE)	
		colnames(sraFiles) <- c(names(sra_acc), srcType)
	} 
	return(sraFiles);
}






