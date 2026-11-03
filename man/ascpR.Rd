\name{ascpR}
\alias{ascpR}
\title{Fasp file downloading using the ascp command line program }
\description{
  \strong{Deprecated:} SRAdb is deprecated and will be removed from
  Bioconductor; the SRAmetadb database is no longer updated. Use the
  \pkg{omicidxr} package (\url{https://omicidx.cancerdatasci.org/guides/r-omicidxr.html})
  instead. See \link{SRAdb-deprecated}.

This function downloads files by fasp protocol using Aspera's ascp command line program, which is include in Aspera Connect software (http://www.asperasoft.com/). 
}
\usage{
ascpR( ascpCMD, ascpSource, destDir = getwd() )
}
\arguments{
  \item{ascpCMD}{	
  ascp main commands, which should be constructed by a user according to the actual installation of Aspera Connect in the system, with proper options to be used.  Example commands: "ascp -QT -l 300m -i /usr/local/aspera/connect/etc/asperaweb_id_dsa.putty" (Linux) or "'/Applications/Aspera Connect.app/Contents/Resources/ascp' -QT -l 300m -i '/Applications/Aspera Connect.app/Contents/Resources/asperaweb_id_dsa.putty'" (Mac OS X).  More about ascp please see the help ('ascp -h' in a shell).
}
  \item{ascpSource}{
  character vector of fasp file sources for the ascp command, e.g. era-fasp@fasp.sra.ebi.ac.uk:vol1/fastq/SRR000/SRR000648/SRR000648.fastq.gz (EBI), anonftp@ftp-trace.ncbi.nlm.nih.gov:/sra/sra-instant/reads/ByRun/sra/SRR/SRR000/SRR000657/SRR000657.sra (NCBI).
}
  \item{destDir}{
  destination directory to save downloaded files.
}
}
\details{
	The function takes advatage of Aspera's fasp transport technology (http://www.asperasoft.com/), which provides high-speed transfering large files over the Internet.   Due to complexity with options with ascp and installation difference between different systems, this funciton asks users to supply main ascp comands.  Users who are not familiar with ascp command line program should have IT support personnel to install the software and constrct main ascp comands. 

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
\link{SRAdb-deprecated}

\code{\link{ascpSRA}}, \code{\link{getSRAfile}}, \code{\link{getFASTQinfo}}, \code{\link{getSRAinfo}}
}
\examples{
## Using the SRAmetadb demo database
\dontrun{
	library( SRAdb )
	sra_dbname <- file.path(system.file('extdata', package='SRAdb'), 'SRAmetadb_demo.sqlite')	
	sra_con <- dbConnect(dbDriver("SQLite"), sra_dbname)
	rs <- getFASTQinfo (in_acc=c("SRR000648","SRR000657"), sra_con, srcType='fasp')
	
	ascpSource <- rs$fasp
	ascpCMD <- 'ascp -QT -l 300m -i /usr/local/aspera/connect/etc/asperaweb_id_dsa.putty'
	## common ascpCMD in Mac OS X:
	#ascpCMD = "'/Applications/Aspera Connect.app/Contents/Resources/ascp' -QT -l 300m -i '/Applications/Aspera Connect.app/Contents/Resources/asperaweb_id_dsa.putty'"
	
	ascpR( ascpCMD, ascpSource, destDir = getwd() )
	dbDisconnect( sra_con )
    }

## The actual SRAmetadb sqlite database can be downloaded using function: getSRAdbFile. Warning: the actual SRAmetadb sqlite database is pretty large (> 35GB as of May, 2018) after uncompression. So, downloading and uncompressing of the actual SRAmetadb sqlite could take quite a few minutes depending on your network bandwidth. Direct links for downloading the SRAmetadb sqlite database:  https://s3.amazonaws.com/starbuck1/sradb/SRAmetadb.sqlite.gz https://gbnci-abcc.ncifcrf.gov/backup/SRAmetadb.sqlite.gz
}
