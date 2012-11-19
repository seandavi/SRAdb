\name{listSRAfile}
\alias{listSRAfile}
\title{List sra, sra-lite or fastq data file names associated with input SRA accessions}
\description{
This function lists all sra, sra-lite or fastq data files associated with input SRA accessions
}
\usage{
listSRAfile( in_acc, sra_con, fileType = 'litesra', srcType = 'ftp' )
}
\arguments{
  \item{in_acc}{
character vector of SRA accessions, which should be in same SRA data type, either submission, study, sample, experiment or run.
}
  \item{sra_con}{
connection to the SRAmetadb SQLite database
}
  \item{fileType}{
types of SRA data files, which should be 'sra',  'litesra' or 'fastq'.
}
  \item{srcType}{
  type of transfer protocol, which should be "ftp" or  "fasp". 
}

}
\details{
SRA fastq files are hosted at EBI ftp site (ftp://ftp.sra.ebi.ac.uk/vol1/fastq/) and .sra or .lite.sra files are hosted at NCBI ftp site (ftp://ftp-trace.ncbi.nlm.nih.gov/sra/sra-instant/reads/). Note: NCBI SRA is phasing out 'litesra' files and currently 'litesra' ftp addresses are pointing to the 'sra' files.
}
\value{
A data frame of matched SRA accessions and data file names with ftp or fasp addresses. 
}
\author{
Jack Zhu <zhujack@mail.nih.gov>
}
\seealso{
\code{\link{getSRAfile}}
}
\examples{
if( file.exists('SRAmetadb.sqlite') ) {
	\dontrun{
	library(SRAdb)
	sra_dbname <- 'SRAmetadb.sqlite'	
	sra_con <- dbConnect(dbDriver("SQLite"), sra_dbname)

	## List ftp or fasp addresses of sra files associated with "SRX000122"
	listSRAfile (in_acc = c("SRX000122"), sra_con = sra_con, fileType = 'sra')
	listSRAfile (in_acc = c("SRX000122"), sra_con = sra_con, fileType = 'sra', srcType='fasp')
	}
} else {
	print("use getSRAdbFile() to get a copy of the SRAmetadb.sqlite file  and then rerun the example")
}
}

