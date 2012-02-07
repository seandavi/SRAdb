\name{getSRAfile}
\alias{getSRAfile}
\title{Download sra, sra-lite or fastq data files associated with input SRA accessions from NCBI SRA ftp site or EBI ENA ftp site }
\description{
This function will  download sra and sra-lite data files associated with input SRA accessions from NCBI SRA ftp site and download fastq files from EBI ENA ftp site.  The tranfer protocol can be either ftp or fasp, the later is high-speed tranfer protocel by Aspera Connect. 
}
\usage{
getSRAfile(in_acc, sra_con, destDir=getwd(), fileType='litesra', srcType='ftp', makeDirectory=FALSE, method='curl', ascpCMD=NULL)
}
\arguments{
  \item{in_acc}{
character vector of SRA accessions and should be of same SRA data type, either one of SRA  submission, SRA study, SRA  sample, SRA  experiment and SRA  run.
}
  \item{sra_con}{
Connection to the SRAmetadb SQLite database
}
  \item{destDir}{
Directory where downloaded sra or litesra files are saved
}
  \item{fileType}{
Type of SRA data files, which should be "sra",  "litesra", "fastq".
}
  \item{srcType}{
Type of data transfer, which should be "ftp" or  "fasp".
}
  \item{makeDirectory}{
logical, TRUE or FALSE. If TRUE and baseDir does not exists, storedir will be created to save downloaded files, otherwise downloaded fastq files will be saved to current directory. 
}
  \item{method}{Character vector of length 1, passed to the identically
    named argument of \code{\link{download.file}}.
}
  \item{ascpCMD}{	
  ascp main command, which should be constructed by a user according to the actual installation of Aspera Connect in his history and carefully selected options.  Example commands: " ascp -QT -l 300m -i /usr/local/aspera/connect/etc/asperaweb_id_dsa.putty".  More about ascp please see the help ('ascp -h' in a shell)
}

}
\details{
The function will convert all input SRA accessions to other types of SRA accessions and then donwload data files:  sra or sra-lite data files will be downloaded from NCBI ftp site and fastq files will be downloaded from EBI ENA ftp site. 
}
\author{
Jack Zhu <zhujack@mail.nih.gov>
}
\section{Warning }{
The size of sra or sra-lite data files in SRA could be very large and downloading multiple ones could take long time and quite some storage space	
}
\seealso{
\code{\link{getSRAfile}}, \code{\link{listSRAfile}}
}
\examples{
if(file.exists('SRAmetadb.sqlite')) {

	library(SRAdb)
	sra_dbname <- 'SRAmetadb.sqlite'	
	sra_con <- dbConnect(dbDriver("SQLite"), sra_dbname)
	\dontrun{
		## Download all available litesra files associated with "SRR000648" and "SRR000657" from NCBI SRA ftp site to current directory by ftp protocol:
		getSRAfile (in_acc=c("SRR000648","SRR000657"), sra_con=sra_con, destDir=getwd(), fileType='litesra')
	
		## Convert NCBI SRA format (.lite.sra or .sra) data into Fastq:
		## Download SRA Toolkit: http://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?cmd=show&f=software&m=software&s=software 
	    ## Run fastq-dump to 
		## system ("fastq-dump SRR000648.lite.sra")
	
		## Download all available fastq files associated with "SRR000648" and "SRR000657" from EBI  ftp site to current directory by ftp protocol:
		getSRAfile (in_acc, sra_con, destDir=getwd(), fileType='fastq', srcType='ftp', makeDirectory=FALSE, method='curl', ascpCMD=NULL)
	
		## Download all available fastq files associated with "SRR000648" and "SRR000657" from EBI  ftp site to current directory by fasp protocol:
		ascpCMD =  'ascp -QT -l 300m -i /usr/local/aspera/connect/etc/asperaweb_id_dsa.putty'
		getSRAfile (in_acc, sra_con,  fileType='fastq', srcType='fasp',  ascpCMD=ascpCMD)
	}
	dbDisconnect(sra_con)
} else {
  	print("use getSRAdbFile() to get a copy of the SRAmetadb.sqlite file and then rerun the example")
}
}

