\name{getFASTQfile}
\alias{getFASTQfile}
\title{Download SRA fastq files from EBI ENA ftp site for a list of input SRA accessions }
\description{
This function downloads fastq data files associated with a list of input SRA accessions from EBI ENA ftp site. 
}
\usage{
getFASTQfile (in_acc, destDir=getwd(), srcType='ftp', makeDirectory=FALSE, method='curl', ascpCMD=NULL)
}
\arguments{
  \item{in_acc}{
 	Character vector of SRA accessions that could be be one or more of these types: SRA study, sample, experiment and/or run.
}
  \item{destDir}{
	Directory where downloaded fastq files are saved
}
  \item{srcType}{
Type of data transfer, which should be "ftp" or  "fasp".
}
  \item{makeDirectory}{
	Logical, TRUE or FALSE. If TRUE and baseDir does not exists, storedir will be created to save downloaded files, otherwise downloaded fastq files will be saved to current directory. 
}
  \item{method}{
  Character vector of length 1, passed to the identically
    named argument of \code{\link{download.file}}.
}
  \item{ascpCMD}{	
  ascp main commands, which should be constructed by a user according to the actual installation of Aspera Connect in his system and proper options to be used.  Example commands: " ascp -QT -l 300m -i /usr/local/aspera/connect/etc/asperaweb_id_dsa.putty".  More about ascp please see the help ('ascp -h' in a shell).
}

}
\details{
	The function first gets all fastq ftp or fasp addresses from the EBI ENA web site (http://www.ebi.ac.uk/ena/data/view/reports/sra/fastq_files/) for a given list of input SRA accessions; then download the fastq files.
}
\author{
Jack Zhu <zhujack@mail.nih.gov>
}
\section{Warning }{
	The size of SRA fastq files could be very huge and downloading multiple ones will take long time and use large disk space. For faster donwloading, consider using Aspera Connect or Aspera ascp command line program (http://www.asperasoft.com/download_connect/).
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
	
		## Download all available fastq files associated with "SRR000648" and "SRR000657" from EBI ENA ftp site to current directory
		getFASTQfile ( in_acc = c("SRR000648","SRR000657"), destdir = getwd() )
		
		## Download all available fastq files associated with "SRR000648" and "SRR000657" from EBI ENA ftp site to current directory
		ascpCMD = 'ascp -QT -l 300m -i /usr/local/aspera/connect/etc/asperaweb_id_dsa.putty'
		getFASTQfile ( in_acc = c("SRR000648","SRR000657"), srcType='fasp', ascpCMD=ascpCMD )

		dbDisconnect( sra_con )
	}
} else {
  	print("use getSRAdbFile() to get a copy of the SRAmetadb.sqlite file and then rerun the example")
}
}

