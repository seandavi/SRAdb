\name{listSRAfile}
\alias{listSRAfile}
\title{List sra, sra-lite or fastq data file names associated with input SRA accessions}
\description{
This function lists all sra, sra-lite or fastq data files associated with input SRA accessions
}
\usage{
listSRAfile( in_acc, sra_con, fileType = 'sra', srcType = 'ftp' )
}
\arguments{
  \item{in_acc}{
character vector of SRA accessions, which should be in same SRA data type, either submission, study, sample, experiment or run.
}
  \item{sra_con}{
connection to the SRAmetadb SQLite database
}
  \item{fileType}{
types of SRA data files, which should be 'sra' or 'fastq'. ('litesra' has phased out ).
}
  \item{srcType}{
  type of transfer protocol, which should be "ftp" or  "fasp". 
}

}
\details{
SRA fastq files are hosted at EBI ftp site (ftp://ftp.sra.ebi.ac.uk/vol1/fastq/) and .sra  files are hosted at NCBI ftp site (ftp://ftp-trace.ncbi.nlm.nih.gov/sra/sra-instant/reads/). 'litesra' has phased out.
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
## Using the SRAmetadb demo database
	\dontrun{
	library(SRAdb)
	sra_dbname <- file.path(system.file('extdata', package='SRAdb'), 'SRAmetadb_demo.sqlite')	
	sra_con <- dbConnect(dbDriver("SQLite"), sra_dbname)

	## List ftp or fasp addresses of sra files associated with "SRX000122"
	listSRAfile (in_acc = c("SRX000122"), sra_con = sra_con, fileType = 'sra')
	listSRAfile (in_acc = c("SRX000122"), sra_con = sra_con, fileType = 'sra', srcType='fasp')
	}

## The actual SRAmetadb sqlite database can be downloaded using function: getSRAdbFile. Warning: the actual SRAmetadb sqlite database is pretty large (> 35GB as of May, 2018) after uncompression. So, downloading and uncompressing of the actual SRAmetadb sqlite could take quite a few minutes depending on your network bandwidth. Direct links for downloading the SRAmetadb sqlite database:  https://s3.amazonaws.com/starbuck1/sradb/SRAmetadb.sqlite.gz https://gbnci-abcc.ncifcrf.gov/backup/SRAmetadb.sqlite.gz
}

