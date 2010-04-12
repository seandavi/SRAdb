sraGraph <-
function (search_terms, sra_con) {
	## get acc data.frame	
	acc <- getSRA(search_terms, out_types='sra', sra_con, acc_only=TRUE)
	## create graphNEL object
	g <- entityGraph(acc)
	return(g)
}


