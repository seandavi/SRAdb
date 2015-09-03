\name{getFASTQfile}
\alias{getFASTQfile}
\title{Download SRA fastq files from EBI ENA through ftp or fasp}
\description{
This function downloads SRA fastq data files through ftp or fasp from EBI ENA site for a given list of SRA accessions. 
}
\usage{
getFASTQfile( in_acc, sra_con, destDir = getwd(), srcType = 'ftp', makeDirectory = FALSE, method = 'curl', ascpCMD = NULL)
}
\arguments{
  \item{in_acc}{
character vector of SRA accessions that could be be in one or more SRA sata types: study, sample, experiment and/or run.
}
  \item{sra_con}{
connection to the SRAmetadb SQLite database
}
  \item{destDir}{
 destination directory to save downloaded fastq files
}
  \item{srcType}{
  type of transfer protocol, which should be "ftp" or  "fasp".
}
  \item{makeDirectory}{
 logical, TRUE or FALSE. If TRUE and baseDir does not exists, storedir will be created to save downloaded files, otherwise downloaded fastq files will be saved to current directory. 
}
  \item{method}{
  character vector of length 1, passed to the identically
    named argument of \code{\link{download.file}}.
}
  \item{ascpCMD}{	
    ascp main commands, which should be constructed by a user according to the actual installation of Aspera Connect in the system, with proper options to be used.  Example commands: "ascp -QT -l 300m -i /usr/local/aspera/connect/etc/asperaweb_id_dsa.putty" (Linux) or "'/Applications/Aspera Connect.app/Contents/Resources/ascp' -QT -l 300m -i '/Applications/Aspera Connect.app/Contents/Resources/asperaweb_id_dsa.putty'" (Mac OS X).  More about ascp please see the help ('ascp -h' in a shell).
}
}
\details{
The function first gets ftp/fasp addresses of SRA fastq files using funcitn \code{\link{getFASTQinfo}} for a given list of input SRA accessions; then downloads the fastq files through ftp or fasp.
}
\author{
Jack Zhu <zhujack@mail.nih.gov>
}
\section{Warning }{
 Downloading SRA fastq files through ftp over long distance could take long time and should consider using using 'fasp'.
}
\seealso{
\code{\link{getFASTQinfo}}, \code{\link{getSRAfile}}, \code{\link{ascpR}}
}
\examples{
if(file.exists('SRAmetadb.sqlite')) {
	\dontrun{
	library(SRAdb)
	sra_dbname <- 'SRAmetadb.sqlite'	
	sra_con <- dbConnect( dbDriver("SQLite"), sra_dbname )
	
	## Download fastq files from EBI ENA  through ftp
	getFASTQfile( in_acc = c("SRR000648","SRR000657"), sra_con, destDir = getwd(), srcType = 'ftp', ascpCMD = NULL )
		
	## Download fastq files from EBI ENA  through fasp
	ascpCMD <- 'ascp -QT -l 300m -i /usr/local/aspera/connect/etc/asperaweb_id_dsa.putty'
	## common ascpCMD for a system with Mac OS X:
	#ascpCMD <- "'/Applications/Aspera Connect.app/Contents/Resources/ascp' -QT -l 300m -i '/Applications/Aspera Connect.app/Contents/Resources/asperaweb_id_dsa.putty'"	
	getFASTQfile( in_acc = c("SRR000648","SRR000657"), sra_con, srcType='fasp', ascpCMD=ascpCMD )
	
	dbDisconnect( sra_con )
	}
} else {
	print("use getSRAdbFile() to get a copy of the SRAmetadb.sqlite file and then rerun the example")
}
}

