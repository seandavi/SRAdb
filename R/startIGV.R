startIGV <- 
function (memory='mm', devel=FALSE) {
	
	memory1 = paste('_', memory, sep='')
	if( memory=='hm' ) {
        message("Launching IGV with 10 GB maximum usable memory")
	} else if (memory=='lm') {
		message("Launching IGV with 2 GB maximum usable memory")
	} else if (memory=='mm') {
		message("Launching IGV with 1.2 GB maximum usable memory")
	} else {
		message("Launching IGV with 750 MB maximum usable memory")
		memory1 = ''
	}
	if(devel) {
		startIGV_url <- paste('http://www.broadinstitute.org/igvdata/jws/dev/igv',
              memory1,'_dev.jnlp', sep='')
	} else {
		startIGV_url <- paste('http://www.broadinstitute.org/igvdata/jws/prod/igv',
              memory1,'.jnlp', sep='')
    }
	browseURL(startIGV_url)	
	message("Please go to the pop up window of the Java Web Start to compelete the launching. ")

}

