\name{sraConvert}
\alias{sraConvert}
\title{Cross-reference between GEO data types}
\description{
  A common task is to find all the SRA entities of one type associated
  with another SRA entity (eg., find all SRA samples associated with SRA
  study 'SRP001990'). This function provides a very fast mapping between
  entity types to facilitate queries of this type.
}
\usage{
sraConvert(in_acc, out_type = c("sra", "submission", "study", "sample", "experiment", "run"), sra_con)
}
\arguments{
  \item{in_acc}{
Character vector of SRA accessions and should be of same SRA data type, either one of SRA  submission, SRA study, SRA  sample, SRA  experiment and SRA  run'
}
  \item{out_type}{
Character vector of the following SRA data types: 'sra', 'submission','study','sample','experiment','run'; if 'sra' is in out_type, out_type  will be c("submission", "study", "sample", "experiment", "run")
}
  \item{sra_con}{
Connection to the SRAmetadb SQLite database
}
}
\value{
A data.frame containing all matched SRA accessions.
}
\author{
Jack Zhu <zhujack@mail.nih.gov>
}
\seealso{
\code{\link{getSRA}}, \code{\link{listSRAfile}}, \code{\link{getSRAinfo}}
}
\examples{
if(file.exists('SRAmetadb.sqlite')) {

	library(SRAdb)
	sra_dbname <- 'SRAmetadb.sqlite'	
	sra_con <- dbConnect(dbDriver("SQLite"), sra_dbname)

	## Convert SRA experiment accessions to other types
	a <- sraConvert( in_acc=c(" SRR000137", "SRR000138 "), out_type=c('sample'), sra_con=sra_con )
	b <- sraConvert (in_acc=c("SRX000089"), sra_con=sra_con) 

} else {
  	print("use getSRAdbFile() to get a copy of the SRAmetadb.sqlite file
and then rerun the example")
}
}
\keyword{ database }
\keyword{ SRA }
