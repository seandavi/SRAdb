\name{ascpSRA}
\alias{ascpSRA}
\title{Fasp SRA data file downloading using the ascp command line program }
\description{
This function downloads SRA data files (fastq, sra or litesra) by fasp protocol using Aspera's ascp command line program, which is include in Aspera Connect software (http://www.asperasoft.com/). 
}
\usage{
ascpSRA ( in_acc, sra_con, ascpCMD, fileType = 'litesra', destDir = getwd() )
}
\arguments{
  \item{in_acc}{
character vector of SRA accessions, which should be in same SRA data type, either submission, study, sample, experiment or run.
}
  \item{sra_con}{
connection to the SRAmetadb SQLite database.
}
  \item{ascpCMD}{	
 ascp main commands, which should be constructed by a user according to the actual installation of Aspera Connect in the system, with proper options to be used.  Example commands: "ascp -QT -l 300m -i /usr/local/aspera/connect/etc/asperaweb_id_dsa.putty" (Linux) or "'/Applications/Aspera Connect.app/Contents/Resources/ascp' -QT -l 300m -i '/Applications/Aspera Connect.app/Contents/Resources/asperaweb_id_dsa.putty'" (Mac OS X).  More about ascp please see the help ('ascp -h' in a shell).
}
  \item{fileType}{
 type of SRA data files, which should be "sra",  "litesra" or "fastq".
}
  \item{destDir}{
  destination directory to save downloaded files.
}
}
\details{
	This function will get fasp file sources first using funciton \code{\link{listSRAfile}} and then download data files using function  \code{\link{ascpR}}.
}
\value{
A data.frame of all matched SRA accessions and ftp or fasp file addresses.
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
if( file.exists('SRAmetadb.sqlite') ) {
	\dontrun{
	library(SRAdb)
	sra_dbname <- 'SRAmetadb.sqlite'	
	
	sra_con <- dbConnect(dbDriver("SQLite"), sra_dbname)
	in_acc <- c("SRR000648","SRR000657")
	ascpCMD <- 'ascp -QT -l 300m -i /usr/local/aspera/connect/etc/asperaweb_id_dsa.putty'
	## common ascpCMD for a system with Mac OS X:
	#ascpCMD <- "'/Applications/Aspera Connect.app/Contents/Resources/ascp' -QT -l 300m -i '/Applications/Aspera Connect.app/Contents/Resources/asperaweb_id_dsa.putty'"
	
	sraFiles <- ascpSRA( in_acc, sra_con, ascpCMD, fileType = 'litesra', destDir=getwd() )
	dbDisconnect(sra_con)
	}
} else {
	  print( "Use ascpSRAdbFile() to get a copy of the SRAmetadb.sqlite file  and then rerun the example" )
}
}
