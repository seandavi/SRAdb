\name{getSRAinfo}
\alias{getSRAinfo}
\title{Get SRA data file information from NCBI SRA}
\description{
This function gets SRA .sra or .lite.sra file information from NCBI SRA ftp site  for a given list SRA accessions.
}
\usage{
getSRAinfo( in_acc, sra_con, sraType = 'litesra' )
}
\arguments{
  \item{in_acc}{
character vector of SRA accessions, which should be in same SRA data type, either submission, study, sample, experiment or run.
}
  \item{sra_con}{
connection to the SRAmetadb SQLite database
}
  \item{sraType}{
type of SRA data files, which should be either  'sra' or 'litesra'.
}
}
\details{
The function first gets ftp addressed of sra or sra-lite data files with function \code{\link{listSRAfile}} and then get file size and date from NCBI SRA ftp sites. 
}
\value{
A data.frame of ftp addresses of SRA data files,  and file size and date along with input SRA accessions.
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
	# getSRAinfo (in_acc=c("SRS012041","SRS000290"), sra_con=sra_con, sraType='litesra')

} else {
  	print(" use getSRAdbFile() to get a copy of the SRAmetadb.sqlite file  and then rerun the example")
}
}

