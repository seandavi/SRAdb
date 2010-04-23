IGVsession <-
function (files, sessionFile, genome='hg18', VisibleAttribute='', destdir=getwd()) 
{
	if(nargs() < 2) stop(print('Both "files" and "sessionFile" are required!'))
	if(length(files)<1) stop('Files must be specified')
	if(length(sessionFile)<1) stop('sessionFile must be specified')
	
	session <- ''
	## Genome
	session <- paste(session, '<?xml version="1.0" encoding="UTF-8"?>\n<Global  genome="', genome, '" version="2">\n<Files>\n', sep='')
	## DataFile
	for(file1 in files) {
		session <- paste(session, '<DataFile name="', file1, '" />\n', sep='')
	}	
	session <- paste(session, '\n</Files>\n', sep='')
	## VisibleAttribute;
	if(! (length(VisibleAttribute) == 1 && VisibleAttribute == '') ) {
		session <- paste(session, '<VisibleAttributes>\n', sep='')
		for( att in VisibleAttribute ) 
			session <- paste(session, '<VisibleAttribute name="', att,  '" />\n', sep='')
		session <- paste(session, '</VisibleAttributes>\n', sep='')		
	}
	session <- paste(session, '<ColorScales/>\n</Global>\n', sep='')
	IGVsessionFile <- file.path(destdir, sessionFile)
	con_session <- file(IGVsessionFile,'w')
	writeLines(session, con = con_session);	
	close(con_session)	
	return(IGVsessionFile)
}
