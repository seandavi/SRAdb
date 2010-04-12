load2IGV <-
function (files, locus='', genome='', Merge=TRUE, port='60151') {
	
	if(locus!='') {
		locus_str <- paste('&locus=',locus,sep='')
	} else {
		locus_str <- ''
	}

	if(genome!='') {
		genome_str <- paste('&genome =', genome,sep='')
	} else {
		genome_str <- ''
	}
		
	if( Merge ) {
		 merge_str <- '&merge=true'
		 message("Merging the following files to existing (1st one) IGV:")
	} else {
		merge_str <- '&merge=false'
		message("Flushing the existing (1st one) IGV with the following files :")
	}
	
	message(basename(files))
	files <- paste(files, collapse=',')
	load2IGV_url <-
        paste('http://localhost:',port ,'/load?file=', files,
              merge_str, locus_str, genome_str, sep='')
	message(load2IGV_url)
	browseURL(load2IGV_url)	

}
