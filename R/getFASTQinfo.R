## getFASTQinfo is to get Fastq information from EBI web site
## in_acc: can be one or more these types: study,sample, experiment, run
## srcType can be 'ftp' or 'fasp'

## fasp example:
# era-fasp@fasp.sra.ebi.ac.uk:/vol1/fastq/SRR392/SRR392120/SRR392120.fastq.gz .

## ftp example:
# ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR392/SRR392120/SRR392120.fastq.gz

# getFASTQinfo (in_acc=c("SRR000648","SRR000657"), srcType='fasp')

getFASTQinfo <-
function (in_acc, srcType = 'ftp') {
	## trim any spaces
	in_acc <- sub('\\s+','', in_acc, perl=TRUE)
	in_acc <- toupper(in_acc)
	## loop
	fastqFiles <- data.frame()
	for ( acc in in_acc ) {
		src <- paste('http://www.ebi.ac.uk/ena/data/view/reports/sra/fastq_files/', acc, sep='')
		if( !inherits(try( con <- file(src, 'r'), silent = TRUE), "try-error" )) {
			fastqFiles1 <- read.delim(con, stringsAsFactors = FALSE)
			fastqFiles <- rbind(fastqFiles, fastqFiles1)
			close(con)
		} else {
			print(paste( "No fastq file for ", acc, sep=''))	
		}
	}
	fastqFiles <- unique(fastqFiles)
	names (fastqFiles) <- tolower (names(fastqFiles))
	if( srcType == 'fasp' ) {
		fastqFiles$ftp <- sub('ftp://ftp.sra.ebi.ac.uk/', 'era-fasp@fasp.sra.ebi.ac.uk:', fastqFiles$ftp)	
		names(fastqFiles)[ncol(fastqFiles)] <- 'fasp'	
	} 
	return(fastqFiles);
}

