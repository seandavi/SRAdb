sraConvert <-
function (in_acc,
          out_type=c('sra','submission','study','sample','experiment','run'),
          sra_con)
{
	out_type <- tolower(out_type);
	out_type <- match.arg(out_type, several.ok = T)
	if( is.element('sra',out_type) )
        out_type = c('submission','study','sample','experiment','run')
			
	## validate in_acc
	valid_in_acc_type <-
        c('SRA', 'ERA', 'DRA', 'SRP', 'ERP', 'DRP', 'SRS', 'ERS',
          'DRS', 'SRX', 'ERX', 'DRX', 'SRR', 'ERR', 'DRR')
	valid_in_type <-
        c('SRA'='submission', 'ERA'='submission', 'DRA'='submission',
          'SRP'='study', 'ERP'='study', 'DRP'='study', 'SRS'='sample',
          'ERS'='sample', 'DRS'='sample', 'SRX'='experiment',
          'ERX'='experiment', 'DRX'='experiment', 'SRR'='run',
          'ERR'='run', 'DRR'='run')
	
	## trim leading or tailing spaces
	in_acc <- sub('^\\s+|\\s+$','', in_acc, perl=TRUE)
	## the first three should be letters, not special characters, and
	## followed by numbers
	if(any(grep('\\^W{3}|\\D+$', in_acc, perl=TRUE)))
        stop("invalid input SRA accession(s), right ones are like 'SRA003625' or 'SRP000403', or 'SRS001834', 'SRR013350', or 'SRX002512'")

	## extract the leading letters, which should be valid 
	in_acc_type = toupper(unique(sub('\\d+$', '', in_acc, perl= TRUE)))
	## they should be valid
	if( !all(in_acc_type %in%  valid_in_acc_type) )
        stop("Input type shuld be in '",
             paste(valid_in_acc_type, collapse="' '"),
             "'")
	in_type <- unique(valid_in_type[in_acc_type])
	## in_type should be only one type
	if(length(in_type) != 1 )
        stop("Only one type of SRA accession(s) is allowed in an input accession vector, either 'submission','study','sample','experiment' or 'run'")

	## Exclude the in_type in the out_type	
	out_type <- out_type[out_type != in_type];
	select_type <- c(in_type, out_type)	
	
	##Remove self converion
#	if(length(out_type) == 0) {		
#		sra_acc <- as.data.frame(cbind(run = in_acc))
#		return(sra_acc)
#		## print("Not necessary to convert to input itself");
#	}
	
	in_acc_sql = paste("'", paste(in_acc, collapse = "','"),"'", sep="");
	select_type_sql <- paste(paste(select_type, "_accession", sep=''),
                             collapse = "," );
	sql <- paste ("SELECT DISTINCT ", select_type_sql,
                  " FROM sra WHERE ", in_type ,
                  "_accession IN (", in_acc_sql, ")", sep = "");			 
	sra_acc <- dbGetQuery(sra_con, sql);
	names(sra_acc) <- sub('_accession', '', names(sra_acc))
	return(sra_acc);

}

