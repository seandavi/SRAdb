load2newIGV <-
function (files, locus='') {
	
	if(locus!='') {
		locus_str <- paste('&locus=',locus,sep='')
	} else {
		locus_str <- ''
	}
	
	message('Starting IGV ...\n',
	        'Then load the following files to IGV:',
            paste(basename(files), collapse=" "))
	files <- paste(files, collapse=',')
	load2newIGV_url <-
        paste('http://www.broadinstitute.org/igv/dynsession/igv.jnlp?user=anonymous&sessionURL=',
              files, locus_str, sep='')	
	browseURL(load2newIGV_url)	

}

