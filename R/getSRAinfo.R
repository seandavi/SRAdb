getSRAinfo <-
function( in_acc, sra_con, sraType = 'litesra' ) {
	sraFile <- listSRAfile(in_acc, sra_con=sra_con, fileType=sraType, srcType='ftp')
	sraFileDir <- paste(na.omit(unique(dirname(sraFile$ftp))), '/',
                          sep='')

	file_name=NULL
	file_size=NULL
	file_date=NULL
	require(RCurl)
	opts=curlOptions(header=TRUE)
	for( sraFileDir_1 in sraFileDir ) {		
		x <- getURL(sraFileDir_1,.opts=opts)
		x1 <- strsplit(x[1], "\n")[[1]]
		x2 <- sub('^.*\\s+anonymous\\s+','', x1, perl=TRUE)
	  	file_name <-
            c(file_name,
              paste(sraFileDir_1, sub('^.*\\s+','', x2, perl=TRUE),
                    sep='') )
	  	file_date1 =sub('^\\d+\\s{1}','', x2, perl=TRUE)
	  	file_date <-
            c(file_date,
              substr(file_date1, 1,
                     gregexpr("\\s", file_date1, perl=TRUE)[[1]][4]-1 ) )
	  	file_size <-
            c(file_size,
              ceiling(as.integer(sub('\\s+.*$','', x2, perl=TRUE)) / 1024) )
		## curlPerform sometimes gives 'Access denied: 530' error
		Sys.sleep(0.5)
	}
	
	file_info <-
        as.data.frame(cbind('file_name'=file_name,
                            'size(KB)'=file_size, 'date'=file_date))
	sraFileInfo <-
        merge(sraFile, file_info, by.x="ftp", by.y="file_name",
              all.x=TRUE)
	
	return(sraFileInfo)
}

