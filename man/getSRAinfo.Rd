\name{getSRAinfo}
\alias{getSRAinfo}
\title{Get file size and date from NCBI ftp site for available sra or sra-lite data files associated with input SRA accessions}
\description{
This function will get sra or sra-lite data file size and date from NCBI ftp site associated with input SRA accessions
}
\usage{
getSRAinfo(in_acc, sra_con, sraType='litesra')
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
The function will convert all input SRA accessions to SRA experiment and run accessions and get sra or sra-lite data file size and date from NCBI SRA ftp sites. 
}
\value{
A data.frame containing NCBI ftp addresses to the SRA data files,  and size and date along with input SRA accessions.
}
\author{
Jack Zhu <zhujack@mail.nih.gov>
}
\seealso{
\code{\link{listSRAfile}}, \code{\link{getSRAfile}}
}
\examples{
if(file.exists('SRAmetadb.sqlite')) {

	library(SRAdb)
	sra_dbname <- 'SRAmetadb.sqlite'	
	sra_con <- dbConnect(dbDriver("SQLite"), sra_dbname)
	
	## Get file size and date from NCBI ftp site for available fastq files associated with "SRS012041","SRS000290"
	getSRAinfo (in_acc=c("SRS012041","SRS000290"), sra_con=sra_con, sraType='litesra')

} else {
  	print("use getSRAdbFile() to get a copy of the SRAmetadb.sqlite file  and then rerun the example")
}

}

