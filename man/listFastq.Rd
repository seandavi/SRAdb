\name{listFastq}
\alias{listFastq}
\title{List fastq file names associated with input SRA accessions}
\description{
This function will list all fastq files associated with input SRA accessions
}
\usage{
listFastq(in_acc, sra_con)
}
\arguments{
  \item{in_acc}{
character vector of SRA accessions and should be of same SRA data type, either one of SRA  submission, SRA study, SRA  sample, SRA  experiment and SRA  run'
}
  \item{sra_con}{
Connection to the SRAmetadb SQLite database
}
}
\details{
The function will convert all input SRA accessions to SRA experiment and run accessions and then construct fastq ftp addresses from converted experiment and run accessions. No ftp checking or downloading. Currently only NCBI SRA ftp addresses are created. 
}
\value{
List NCBI ftp links to SRA fastq files along with input SRA accessions.
}
\author{
Jack Zhu <zhujack@mail.nih.gov>
}
\seealso{
\code{\link{getFastq}}
}
\examples{
if(file.exists('SRAmetadb.sqlite')) {

	library(SRAdb)
	sra_dbname <- 'SRAmetadb.sqlite'	
	sra_con <- dbConnect(dbDriver("SQLite"), sra_dbname)

	## List fastq file ftp addresses associated with "SRA000045"
	listFastq (in_acc=c("SRA000045"), sra_con=sra_con)

} else {
  	print("use getSRAdbFile() to get a copy of the SRAmetadb.sqlite file  and then rerun the example")
}

}

