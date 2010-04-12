\name{getFastqInfo}
\alias{getFastqInfo}
\title{Get file size and date from NCBI ftp site for available fastq files associated with input SRA accessions}
\description{
This function will get fastq file size and date from NCBI ftp site associated with input SRA accessions
}
\usage{
getFastqInfo(in_acc, sra_con)
}
\arguments{
  \item{in_acc}{
character vector of SRA accessions and should be of same SRA data type, either one of SRA  submission, SRA study, SRA  sample, SRA  experiment and SRA  run}
  \item{sra_con}{
Connection to the SRAmetadb SQLite database
}
}
\details{
The function will convert all input SRA accessions to SRA experiment and run accessions and get file size and date from NCBI SRA ftp sites. 
}
\value{
A data.frame containing NCBI ftp addresses to the SRA fastq files,  and size and date along with input SRA accessions.
}
\author{
Jack Zhu <zhujack@mail.nih.gov>
}
\seealso{
\code{\link{listFastq}}, \code{\link{getFastq}}
}
\examples{
if(file.exists('SRAmetadb.sqlite')) {

	library(SRAdb)
	sra_dbname <- 'SRAmetadb.sqlite'	
	sra_con <- dbConnect(dbDriver("SQLite"), sra_dbname)
	
	## Get file size and date from NCBI ftp site for available fastq files associated with "SRS012041","SRS000290"
	getFastqInfo (in_acc=c("SRS012041","SRS000290"), sra_con=sra_con)

} else {
  	print("use getSRAdbFile() to get a copy of the SRAmetadb.sqlite file  and then rerun the example")
}

}

