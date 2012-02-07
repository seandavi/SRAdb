\name{ascpR}
\alias{ascpR}
\title{Download SRA data files using Aspera's ascp command line program }
\description{
This function downloads SRA data files using Aspera's ascp command line program, which is include in Aspera Connect software (http://www.asperasoft.com/). 
}
\usage{
ascpR ( ascpCMD, ascpSource, destDir=getwd() )
}
\arguments{
  \item{ascpCMD}{	
  ascp main commands, which should be constructed by a user according to the actual installation of Aspera Connect in his system and proper options to be used.  Example commands: ' ascp -QT -l 300m -i /usr/local/aspera/connect/etc/asperaweb_id_dsa.putty'.  More about ascp please see the help ('ascp -h' in a shell).
}
  \item{ascpSource}{
  Character vector of sources for ascp command, e.g. era-fasp@fasp.sra.ebi.ac.uk:vol1/fastq/SRR000/SRR000648/SRR000648.fastq.gz, anonftp@ftp-trace.ncbi.nlm.nih.gov:/sra/sra-instant/reads/ByExp/litesra/SRX/SRX000/SRX000122/SRR000657/SRR000657.lite.sra .
}
  \item{destDir}{
	Destination directory where to save downloaded files.
}
}
\details{
	The function takes advatage of Aspera’s fasp transport technology (http://www.asperasoft.com/), which provides high-speed transfering large files over the Internet.   Due to complexity with options in ascp and installation difference between different platforms, this funciton needs users to supply main ascp comands.  Users who are not familiar with ascp should have IT support to install the software and constrct main ascp comands. 

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
\code{\link{ascpSRA}}, \code{\link{getSRAfile}}, \code{\link{getFASTQinfo}}, \code{\link{getSRAinfo}}
}
\examples{
if(file.exists('SRAmetadb.sqlite')) {
 	\dontrun{
		library(SRAdb)
		sra_dbname <- 'SRAmetadb.sqlite'	
		sra_con <- dbConnect(dbDriver("SQLite"), sra_dbname)
		rs <- getFASTQinfo (in_acc=c("SRR000648","SRR000657"), srcType='fasp')
		ascpSource = rs$fasp
		ascpCMD = 'ascp -QT -l 300m -i /usr/local/aspera/connect/etc/asperaweb_id_dsa.putty'
		ascpR ( ascpCMD, ascpSource, destDir=getwd() )
		dbDisconnect(sra_con)
	}
} else {
	  print("use getSRAdbFile() to get a copy of the SRAmetadb.sqlite file  and then rerun the example")
}
}
