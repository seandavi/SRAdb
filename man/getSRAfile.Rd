\name{getSRAfile}
\alias{getSRAfile}
\title{Download SRA data file through ftp or fasp }
\description{
This function downloads sra and sra-lite data files associated with input SRA accessions from NCBI SRA or downloads fastq files from EBI ENA through ftp or fasp protocol.  
}
\usage{
getSRAfile( in_acc, sra_con, destDir = getwd(), fileType = 'litesra', srcType = 'ftp', makeDirectory = FALSE, method = 'curl', ascpCMD = NULL )
}
\arguments{
  \item{in_acc}{
character vector of SRA accessions, which should be in same SRA data type, either submission, study, sample, experiment or run.
}
  \item{sra_con}{
Connection to the SRAmetadb SQLite database
}
  \item{destDir}{
  destination directory to save downloaded files.
}
  \item{fileType}{
 type of SRA data files, which should be "sra",  "litesra" or "fastq".
}
  \item{srcType}{
  type of transfer protocol, which should be "ftp" or  "fasp".
}
  \item{makeDirectory}{
logical, TRUE or FALSE. If TRUE and baseDir does not exists, storedir will be created to save downloaded files, otherwise downloaded fastq files will be saved to current directory. 
}
  \item{method}{Character vector of length 1, passed to the identically
    named argument of \code{\link{download.file}}.
}
  \item{ascpCMD}{	
  ascp main commands, which should be constructed by a user according to the actual installation of Aspera Connect in the system, with proper options to be used.  Example commands: "ascp -QT -l 300m -i /usr/local/aspera/connect/etc/asperaweb_id_dsa.putty" (Linux) or "'/Applications/Aspera Connect.app/Contents/Resources/ascp' -QT -l 300m -i '/Applications/Aspera Connect.app/Contents/Resources/asperaweb_id_dsa.putty'" (Mac OS X).  More about ascp please see the help ('ascp -h' in a shell).
}
}
\details{
The function first gets ftp/fasp addresses of SRA data files with  funcitn \code{\link{getSRAinfo}} for a given list of input SRA accessions; then downloads the SRA data files through ftp or fasp.
The sra or sra-lite data files are downloaded from NCBI SRA and the fastq files are downloaded from EBI ENA. 
}
\author{
Jack Zhu <zhujack@mail.nih.gov>
}
\section{Warning }{
 Downloading SRA data files through ftp over long distance could take long time and should consider using using 'fasp'.
}
\seealso{
\code{\link{listSRAfile}}, \code{\link{getSRAinfo}}, \code{\link{getFASTQinfo}}, \code{\link{getFASTQfile}}
}
\examples{
if( file.exists( 'SRAmetadb.sqlite' ) ) {

	library(SRAdb)
	sra_dbname <- 'SRAmetadb.sqlite'	
	sra_con <- dbConnect( dbDriver("SQLite"), sra_dbname )
	
	\dontrun{
	## Download litesra files from NCBI SRA using ftp protocol:
	getSRAfile( in_acc = c("SRR000648","SRR000657"), sra_con = sra_con, destDir = getwd(), fileType = 'litesra' )
	
	## Convert NCBI SRA format (.lite.sra or .sra) data to fastq:
	## Download SRA Toolkit: http://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?cmd=show&f=software&m=software&s=software 
	## Run fastq-dump to 
	## system ("fastq-dump SRR000648.lite.sra")
	
	## Download fastq files from EBI using ftp protocol:
	getSRAfile( in_acc, sra_con, destDir = getwd(), fileType = 'fastq', srcType <- 'ftp', makeDirectory = FALSE, method = 'curl', ascpCMD = NULL )
	
	## Download fastq files from EBI  ftp siteusing fasp protocol:
	ascpCMD <-  'ascp -QT -l 300m -i /usr/local/aspera/connect/etc/asperaweb_id_dsa.putty'
	getSRAfile( in_acc, sra_con,  fileType = 'fastq', srcType = 'fasp',  ascpCMD = ascpCMD )
	}
	
	dbDisconnect( sra_con )
} else {
	print( "use getSRAdbFile() to get a copy of the SRAmetadb.sqlite file and then rerun the example" )
}
}

