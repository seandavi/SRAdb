\name{listSRAfile}
\alias{listSRAfile}
\title{List sra/sra-lite data file names associated with input SRA accessions}
\description{
This function will list all sra/sra-lite files associated with input SRA accessions
}
\usage{
listSRAfile( in_acc, sra_con, sraType='litesra' )
}
\arguments{
  \item{in_acc}{
character vector of SRA accessions and should be of same SRA data type, either one of SRA  submission, SRA study, SRA  sample, SRA  experiment and SRA  run
}
  \item{sra_con}{
Connection to the SRAmetadb SQLite database
}
  \item{sraType}{
types of SRA data files, which should be 'sra' or 'litesra'.
}
}
\details{
The function will convert all input SRA accessions to SRA experiment and run accessions and then construct sra or sra-lite data file ftp addresses from converted experiment and run accessions. No ftp checking or downloading. Currently only NCBI SRA ftp addresses are created. 
}
\value{
List NCBI ftp links to SRA data files along with input SRA accessions.
}
\author{
Jack Zhu <zhujack@mail.nih.gov>
}
\seealso{
\code{\link{getSRAfile}}
}
\examples{
if(file.exists('SRAmetadb.sqlite')) {

	library(SRAdb)
	sra_dbname <- 'SRAmetadb.sqlite'	
	sra_con <- dbConnect(dbDriver("SQLite"), sra_dbname)

	## List fastq file ftp addresses associated with "SRA000045"
	listSRAfile (in_acc=c("SRX000122"), sra_con=sra_con, sraType='sra')

} else {
  	print("use getSRAdbFile() to get a copy of the SRAmetadb.sqlite file  and then rerun the example")
}

}

