\name{ascpSRA}
\alias{ascpSRA}
\title{Download SRA data files using Aspera's ascp command line program }
\description{
This function downloads SRA data files using Aspera's ascp command line program, which is include in Aspera Connect software (http://www.asperasoft.com/). 
}
\usage{
ascpSRA ( in_acc, sra_con, ascpCMD, fileType='litesra', destDir=getwd() )
}
\arguments{
  \item{in_acc}{
character vector of SRA accessions and should be of same SRA data type, either one of SRA  submission, SRA study, SRA  sample, SRA  experiment and SRA  run.
}
  \item{sra_con}{
Connection to the SRAmetadb SQLite database
}
  \item{ascpCMD}{	
  ascp main commands, which should be constructed by a user according to the actual installation of Aspera Connect in his system and proper options to be used.  Example commands: " ascp -QT -l 300m -i /usr/local/aspera/connect/etc/asperaweb_id_dsa.putty".  More about ascp please see the help ('ascp -h' in a shell).
}
  \item{fileType}{
Type of SRA data files, which should be "sra",  "litesra", "fastq".
}
  \item{destDir}{
	Destination directory where to save downloaded files.
}
}
\details{
	This function will get ascp sources first using funciton \code{\link{listSRAfile}} and then download data files using function  \code{\link{ascpR}}.
	

}
\value{
A data.frame containing all matched SRA accessions and ftp or fasp addresses.
}
\references{
http://www.asperasoft.com/
}
\author{
Jack Zhu <zhujack@mail.nih.gov>
}
\seealso{
\code{\link{ascpR}}, \code{\link{listSRAfile}}, \code{\link{getSRAfile}},  \code{\link{getFASTQinfo}}, \code{\link{getSRAinfo}}
}
\examples{
if(file.exists('SRAmetadb.sqlite')) {
 	\dontrun{
		library(SRAdb)
		sra_dbname <- 'SRAmetadb.sqlite'	
		sra_con <- dbConnect(dbDriver("SQLite"), sra_dbname)
		in_acc=c("SRR000648","SRR000657")
		ascpSource = rs$fasp
		ascpCMD = 'ascp -QT -l 300m -i /usr/local/aspera/connect/etc/asperaweb_id_dsa.putty'
		ascpSRA <- function ( in_acc, sra_con, ascpCMD, fileType='litesra', destDir=getwd() )
		dbDisconnect(sra_con)
	}
} else {
	  print("use ascpSRAdbFile() to get a copy of the SRAmetadb.sqlite file  and then rerun the example")
}
}
