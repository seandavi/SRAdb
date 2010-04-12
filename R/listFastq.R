listFastq <-
function (in_acc, sra_con) {
    sra_acc  <- sraConvert (in_acc, out_type = c('experiment','run'),
                            sra_con= sra_con)

	in_acc_sql = paste("'", paste(sra_acc$run, collapse = "','"),"'", sep="")
	sql <- paste("SELECT run_accession, library_layout FROM sra ",
                 "WHERE run_accession IN (", in_acc_sql, ")", sep = "")
	library_layout <- dbGetQuery(sra_con, sql);
	
	ftp=NULL
	for( i in 1:dim(sra_acc)[1] ) {	
		library_layout1 <-
            library_layout[library_layout[,1]== sra_acc$run[i],2]
		if ( is.na(sra_acc$run[i]) ) {
			ftp1 <- c(sra_acc[i,1], NA)
			ftp <- rbind(ftp,ftp1)
		} else if (library_layout1=='SINGLE') {
			ftp1 <- c(sra_acc[i,1],
                      paste('ftp://ftp.ncbi.nih.gov/sra/static/',
                            substring(sra_acc$experiment[i], 1, 6), '/',
                            sra_acc$experiment[i], '/',
                            sra_acc$run[i] , '.fastq.gz', sep=''))

			ftp <- rbind(ftp,ftp1)
		} else {
			ftp1 <- c(sra_acc[i,1],
                      paste('ftp://ftp.ncbi.nih.gov/sra/static/',
                            substring(sra_acc$experiment[i], 1, 6), '/',
                            sra_acc$experiment[i], '/',
                            sra_acc$run[i] , '_1.fastq.gz', sep=''))
			ftp2 <- c(sra_acc[i,1],
                      paste('ftp://ftp.ncbi.nih.gov/sra/static/',
                            substring(sra_acc$experiment[i], 1, 6), '/',
                            sra_acc$experiment[i], '/',
                            sra_acc$run[i] , '_2.fastq.gz', sep=''))
			ftp <- rbind(ftp,ftp1,ftp2)		
		}
	}
	
	colnames(ftp) <- c(names(sra_acc)[1],'fastq')
	rownames(ftp) <- NULL
	ftp <- as.data.frame(ftp, stringsAsFactors=FALSE)
	return(ftp);
}

