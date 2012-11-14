getSRA <- 
function (search_terms, out_types=c('sra','submission','study','sample','experiment','run'), sra_con, acc_only=FALSE) {
	
	out_types <- match.arg(out_types, several.ok = T)
	
	sra_fields <- sqliteTableFields(sra_con, 'sra')
	sra_fields_indice <-
        list(run=seq(which(sra_fields=='run_ID')+1,
                     which(sra_fields=='experiment_ID')-1),
             experiment=seq(which(sra_fields=='experiment_ID')+1,
                            which(sra_fields=='sample_ID')-1),
             sample=seq(which(sra_fields=='sample_ID')+1,
                        which(sra_fields=='study_ID')-1),
             study=seq(which(sra_fields=='study_ID')+1,
                       which(sra_fields=='submission_ID')-1),
             submission=seq(which(sra_fields=='submission_ID')+1,
                            length(sra_fields)),
             sra=c(6:75))
	
	## remove records with all NULL values for out_types
	if ( is.element('sra', out_types) ) {
		sra_fields_indice_1 <- sra_fields_indice[['sra']]
		select_fields = sra_fields[sra_fields_indice_1]
		not_null_str = ''					
	} else {
		## Contruct slect string and accession not null string
		select_fields = NULL
		not_null= NULL
		for(type in out_types ) {
			sra_fields_indice_1 <- sra_fields_indice[[type]]
			select_fields =c(select_fields, sra_fields[sra_fields_indice_1])
			not_null = c(not_null , paste(type, '_accession IS NOT NULL ', sep=''))
		}				
		not_null_str = paste(' AND (', paste(not_null, collapse=' OR '), ')',  sep='')
	}	
	## acc_only
	if( acc_only ) select_fields =rev(select_fields[grep('_accession', select_fields)])
	#print(select_fields);
	
	select_fields_str <- paste(select_fields, collapse=',')
	
	sql <- paste("SELECT DISTINCT ", select_fields_str,
                " FROM sra_ft WHERE sra_ft MATCH '",
                search_terms, "' ", not_null_str, ";", sep='')
	rs <- dbGetQuery(sra_con, sql);
	names(rs) <- sub('_accession', '', names(rs))
	return(rs)	
}
