listSRAfile <-
function (in_acc, sra_con, sraType='litesra') {
    ##sra file ftp example: ftp://ftp-trace.ncbi.nlm.nih.gov/sra/sra-instant/reads/ByExp/sra/SRX/SRX037/SRX037195/SRR089790/SRR089790.sra
    ##sra lite file ftp example:  ftp://ftp-trace.ncbi.nlm.nih.gov/sra/sra-instant/reads/ByExp/litesra/SRX/SRX037/SRX037195/SRR089790/SRR089790.lite.sra
      
      if( sraType == 'litesra' ) { sraExt <- '.lite.sra'; } else { sraExt <- '.sra';}
	sra_acc  <- sraConvert (in_acc, out_type = c('experiment','run'),
                            sra_con= sra_con)
	
	ftp=NULL
	for( i in 1:nrow(sra_acc) ) {			
		sraFileDir<- paste('ftp://ftp-trace.ncbi.nlm.nih.gov/sra/sra-instant/reads/ByExp/', sraType, 
				'/',
				substring(sra_acc$experiment[i], 1, 3), '/',
				substring(sra_acc$experiment[i], 1, 6), '/',
				sra_acc$experiment[i], '/', 
				sra_acc$run[i], '/',
				sep='')
				
		if ( is.na(sra_acc$run[i]) ) {
			ftp1 <- c(sra_acc[i,1], NA)
		} else {
			ftp1 <- c(sra_acc[i,1],
                      paste(sraFileDir, sra_acc$run[i] , sraExt, sep=''))			
		}
		ftp <- rbind(ftp,ftp1)
 	}
	
	colnames(ftp) <- c(names(sra_acc)[1],'sra')
	rownames(ftp) <- NULL
	ftp <- as.data.frame(ftp, stringsAsFactors=FALSE)
	return(ftp);
}

