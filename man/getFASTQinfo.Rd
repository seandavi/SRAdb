\name{getFASTQinfo}
\alias{getFASTQinfo}
\title{Get Fastq file and meta data information for a list of SRA accessions}
\description{
This function will get Fastq file information from EBI ENA web site (http://www.ebi.ac.uk/ena/data/view/reports/sra/fastq_files/), including all matched SRA meta data  and Fastq file information, including ftp links or ascp sources.
}
\usage{
getFASTQinfo(in_acc, srcType='ftp')
}
\arguments{
  \item{in_acc}{
character vector of SRA accessions that could be be one or more of these types: SRA study, sample, experiment and/or run.
}
  \item{srcType}{
	Options to list ftp or fasp or fasp sources. The default is ftp.  
}
}
\details{
EBI ENA web site (http://www.ebi.ac.uk/ena/data/view/reports/sra/fastq_files/) is the souce of data, which is updated and verified daily. This function will get all matched meta data and Fastq file information. The ascp option will list all all ascp sources of any input SRA accessions.  Aspera is a commercial file transfer protocol that provides better transfer speeds than ftp over long distances. A ascp source is something like: 'era-fasp@fasp.sra.ebi.ac.uk:vol1/fastq/SRR392/SRR392040/SRR392040_1.fastq.gz'. The fstq file can be downloaded through ascp command line (shell), e.g.: ascp -QT -l 200m -i asperaweb_id_dsa.putty <ascp source> <destination folder>.  Aspera ascp command line client can be dowloaded http://www.asperasoft.com/download_connect/ .
}
\value{
A data.frame containing All match SRA meta data and ftp/ascp addresses, and file size and read numbers contained.
}
\author{
Jack Zhu <zhujack@mail.nih.gov>
}
\seealso{
\code{\link{listSRAfile}}, \code{\link{getSRAfile}}
}
\examples{
if(file.exists('SRAmetadb.sqlite')) {

	library(SRAdb)
	sra_dbname <- 'SRAmetadb.sqlite'	
	sra_con <- dbConnect(dbDriver("SQLite"), sra_dbname)
	
	## Get file size and date from NCBI ftp site for available fastq files associated with "SRS012041","SRS000290"
	getFASTQinfo (in_acc=c("SRR000648","SRR000657"), srcType='ftp')
	getFASTQinfo (in_acc=c("SRR000648","SRR000657"), srcType='fasp')

} else {
  	print("use getSRAdbFile() to get a copy of the SRAmetadb.sqlite file  and then rerun the example")
}

}

