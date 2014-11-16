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
	sra_acc = sraConvert( in_acc,  sra_con=sra_con  )
	
	sra_acc_run = paste("'", paste(sra_acc$run, collapse = "','"),"'", sep="");
	sql <- paste ("SELECT * FROM fastqlist WHERE fastqlist_accession IN (", sra_acc_run, ")", sep = "");				  			 
	rs_fq <- dbGetQuery(sra_con, sql);	
	names(rs_fq) <- sub('fastqlist_accession', 'run', names(rs_fq))
	names(rs_fq) <- sub('run_accession', 'run', names(rs_fq))
	names(rs_fq) <- sub('file_name', 'ftp', names(rs_fq))	
	
	## format ftp URLs
	rs_fq$ftp <- file.path('ftp://ftp.sra.ebi.ac.uk/vol1/fastq', substring(rs_fq$run, 1, 6), rs_fq$run, rs_fq$ftp)

	## merge acc to the fastq ftp
	fastqFiles <- merge(sra_acc, rs_fq, by='run', all.x=TRUE) 
	if( srcType == 'fasp' ) {
		fastqFiles$ftp <- sub('ftp://ftp.sra.ebi.ac.uk/', 'era-fasp@fasp.sra.ebi.ac.uk:', fastqFiles$ftp)	
		names(fastqFiles) <- sub('ftp', 'fasp', names(fastqFiles))	
	} 
	return(fastqFiles);
}

