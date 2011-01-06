\name{getSRAfile}
\alias{getSRAfile}
\title{Download sra or sra-lite data files associated with input SRA accessions from NCBI SRA ftp site }
\description{
This function will available download sra or sra-lite data files associated with input SRA accessions from NCBI SRA ftp site. 
}
\usage{
getSRAfile(in_acc, sra_con, destdir, sraType='litesra', makeDirectory = FALSE, method)
}
\arguments{
  \item{in_acc}{
character vector of SRA accessions and should be of same SRA data type, either one of SRA  submission, SRA study, SRA  sample, SRA  experiment and SRA  run
}
  \item{sra_con}{
Connection to the SRAmetadb SQLite database
}
  \item{destdir}{
Directory where downloaded fastq files are saved
}
  \item{sraType}{
types of SRA data files, which should be "sra" or "litesra".
}
  \item{makeDirectory}{
logical, TRUE or FALSE. If TRUE and baseDir does not exists, storedir will be created to save downloaded files, otherwise downloaded fastq files will be saved to current directory. 
}
  \item{method}{Character vector of length 1, passed to the identically
    named argument of \code{\link{download.file}}.}
}
\details{
The function will convert all input SRA accessions to SRA experiment and run accessions and then all available sra or sra-lite data files will be downloaded. Currently files are only downloaded from the NCBI SRA ftp site.
}
\author{
Jack Zhu <zhujack@mail.nih.gov>
}
\section{Warning }{
The size of sra or sra-lite data files in SRA could be very large and downloading multiple ones could take long time and quite some storage space	
}
\seealso{
\code{\link{getSRAfile}}, \code{\link{listSRAfile}}
}
\examples{
if(file.exists('SRAmetadb.sqlite')) {

	library(SRAdb)
	sra_dbname <- 'SRAmetadb.sqlite'	
	sra_con <- dbConnect(dbDriver("SQLite"), sra_dbname)
	
	## Download all available fastq files associated with "SRR000648" and "SRR000657" from NCBI SRA ftp site to current directory
	getSRAfile (in_acc=c("SRR000648","SRR000657"), sra_con=sra_con, destdir=getwd(), sraType='litesra')

} else {
  	print("use getSRAdbFile() to get a copy of the SRAmetadb.sqlite file and then rerun the example")
}
}

