entityGraph <- function (df) {
	#convert a vector to 1-row matrix
	if( is.character(df) ) df = t(df)
	df = as.data.frame(df, stringsAsFactors=FALSE)
	if( nrow(df)==0 ) stop('Input has empty row')
	if( ncol(df)<2 ) stop('Input has less than two columns')
	
	## no 'factor'
	nodes = na.omit(unique(as.character(unlist(df))))
	g = new('graphNEL',nodes=nodes, edgemode="directed")
	# now add the edges	
	for(i in 1:(ncol(df)-1)) {		
		df_i <-df[,i:(i+1)]
		df_i <- unique(df_i)		
		apply(df_i,1,function(x) { 
			## exclude edges exists or containing 'NA'
			if( all(!is.na(x)) ) { g <<- addEdge(x[1],x[2],g) }
		}) 		
	}
	return(g)
}


