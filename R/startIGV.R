startIGV <- 
function (max_memory='mm') {
	
	max_memory1 = paste('_', max_memory, sep='')
	if( max_memory=='hm' ) {
        message("Launching IGV with 10 GB maximum usable memory")
	} else if (max_memory=='lm') {
		message("Launching IGV with 2 GB maximum usable memory")
	} else if (max_memory=='mm') {
		message("Launching IGV with 1.2 GB maximum usable memory")
	} else {
		message("Launching IGV with 750 MB maximum usable memory")
		max_memory1 = ''
	}	
	startIGV_url <-
        paste('http://www.broadinstitute.org/igvdata/jws/prod/igv',
              max_memory1,'.jnlp', sep='')
	browseURL(startIGV_url)	
	message("Please go to the pop up window of the Java Web Start to compelete the launching. ")

}

