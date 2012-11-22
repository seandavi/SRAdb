\name{getSRA}
\alias{getSRA}
\title{Fulltext search SRA meta data using SQLite fts3 module }
\description{
This function does Fulltext search on any SRA fields in any SRA data types with Fulltext capacity in the SQLite and returns SRA records
}
\usage{
getSRA(search_terms, out_types=c('sra','submission','study','experiment','sample','run'), sra_con, acc_only=FALSE)
}
\arguments{
  \item{search_terms}{
Free text search terms constructed according to SQLite query syntax defined here: http://www.sqlite.org/fts3.html#section_1_3
}
  \item{out_types}{
Character vector of the following SRA data types: 'sra','submission','study','sample','experiment','run'. Note: if 'sra' is within out_types, the out_types will be set to c('submission','study','sample','experiment').
}
  \item{sra_con}{
Connection to the SRAmetadb SQLite database
}
  \item{acc_only}{
logical, if TRUE, the function will return SRA accession for each out_types

}
}
\details{
Queries performed by this function could be Phrase queries, e.g. '"lin* app*"', or NEAR queries, e.g. '"ACID compliant" NEAR/2 sqlite', or with the Enhanced Query Syntax. Check Full Text Search section on the SQLite site for details. if 'acc_only=TRUE', a data.frame containing only SRA accessions will be returned, which can be used as input for \code{\link{sraGraph}}.

}
\value{
A data.frame containing all returned SRA records with fields defined by out_types.

If acc_only=FALSE, a data.frame of matched accessions of out_types will be returned. 
}
\references{
http://www.sqlite.org/
}
\author{
Jack Zhu <zhujack@mail.nih.gov>
}
\seealso{
\code{\link{sraConvert}}
}
\examples{
if(file.exists('SRAmetadb.sqlite')) {

	library(SRAdb)
	sra_dbname <- 'SRAmetadb.sqlite'	
	sra_con <- dbConnect(dbDriver("SQLite"), sra_dbname)
  
	## Fulltext search SRA meta data using SQLite fts3 module:
	# find all records with words of 'breast' and 'cancer' in a filed and there could be one to many words between 'breast' and 'cancer':   
	rs <- getSRA (search_terms ='breast cancer', out_types=c('run','study'), sra_con=sra_con)
 
	# find all records with exact phrase of 'breast cancer' in a filed:   
	rs <- getSRA (search_terms ='"breast cancer"', out_types=c('run','study'), sra_con=sra_con)
 
	# find records with words beginning with 'braes' and 'can', and the distance between them is equal or less than two words:
	rs <- getSRA (search_terms ='breas* NEAR/2 can*', out_types=c('run','study'), sra_con=sra_con)

	# the same as above except that only one space between the two words  
	rs <- getSRA (search_terms ='"breas* can*"', out_types=c('study'), sra_con=sra_con) 
 
	# find records with 'MCF7' or 'MCF-7' - adding double quote to avoid the SQLite to break down 'MCF-7' to 'MCF' and '7':
	rs <- getSRA (search_terms ='MCF7 OR "MCF-7"', out_types=c('sample'), sra_con=sra_con) 

	# the same as above, but only search the field of 'study_title':
	rs <- getSRA (search_terms ='study_title: brea* can*', out_types=c('run','study'), sra_con=sra_con)  

	# the same as above, but only search the field of 'study_title' and return only accessions:
	rs <- getSRA (search_terms ='study_title: brea* can*', out_types=c('run','study'), sra_con=sra_con, acc_only=TRUE) 

} else {
  	print("use getSRAdbFile() to get a copy of the SRAmetadb.sqlite file  and then rerun the example")
}

}
