## getFASTQinfo is to get Fastq information from EBI web site
## in_acc: can be one or more these types: study,sample, experiment, run
## srcType can be 'ftp' or 'fasp'

## Note EBI added <dir2> for run accesions wirh over 6 digits -details please see http://www.ebi.ac.uk/ena/browse/read-download#archive_generated_fastq_files
## e.g. ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR101/006/SRR1016916/SRR1016916.fastq.gz

## fasp example:
# era-fasp@fasp.sra.ebi.ac.uk:/vol1/fastq/SRR392/SRR392120/SRR392120.fastq.gz .

## ftp example:
# ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR392/SRR392120/SRR392120.fastq.gz

# getFASTQinfo (in_acc=c("SRR000648","SRR000657"), sra_con, srcType='fasp')

getFASTQinfo <-
function (in_acc, sra_con, srcType = 'ftp') {
	## trim any spaces
	in_acc <- sub('\\s+','', in_acc, perl=TRUE)
	sra_acc = sraConvert( in_acc,  sra_con=sra_con  )
	
	sra_acc_run = paste("'", paste(sra_acc$run, collapse = "','"),"'", sep="");
	sql <- paste ("SELECT * FROM fastq WHERE run_accession IN (", sra_acc_run, ")", sep = "");				  			 
	rs_fq <- dbGetQuery(sra_con, sql);	
    names(rs_fq) <- sub("run_accession", "run", names(rs_fq))
    
    df_ftp = NULL
    for (i in 1:length(rs_fq$run)) {
        run1 = rs_fq$run[i]
        if (nchar(run1) < 10) {
            df_ftp_1 <- as.data.frame( cbind("run" = run1, "ftp" = file.path("ftp://ftp.sra.ebi.ac.uk/vol1/fastq",                                       substring(run1, 1, 6), run1, paste(run1, ".fastq.gz", sep="") )))
        } else {
            ## format ftp URLs
            ## Note EBI added <dir2> for run accesions with over 6 digits - details please see http://www.ebi.ac.uk/ena/browse/read-download#archive_generated_fastq_files
            dir2 <- paste("00", substring(run1, nchar(run1), nchar(run1)), sep="")
            if( rs_fq$FASTQ_FILES[i] > 1 ) {
                fastqNames = paste(run1, "_", 1:rs_fq$FASTQ_FILES[i], ".fastq.gz", sep="")
            } else {
                fastqNames = paste(run1, ".fastq.gz", sep="")
            }
            df_ftp_1 <- as.data.frame( cbind("run" = run1, "ftp" = file.path("ftp://ftp.sra.ebi.ac.uk/vol1/fastq",                                       substring(run1, 1, 6), dir2, run1, fastqNames)))
        }
        
        df_ftp = rbind(df_ftp, df_ftp_1)
    }
    fastqFiles <- merge(sra_acc, df_ftp, by = "run")
    if (srcType == "fasp") {
        fastqFiles$ftp <- sub("ftp://ftp.sra.ebi.ac.uk/", "era-fasp@fasp.sra.ebi.ac.uk:", 
                              fastqFiles$ftp)
        names(fastqFiles) <- sub("ftp", "fasp", names(fastqFiles))
    }
    return(fastqFiles)
}


