\name{listSRAfile}
\alias{listSRAfile}
\title{List sra, sra-lite or fastq data file names associated with input SRA accessions}
\description{
This function will list all sra, sra-lite or fastq data files associated with input SRA accessions
}
\usage{
listSRAfile( in_acc, sra_con, fileType='litesra', srcType='ftp')
}
\arguments{
  \item{in_acc}{
character vector of SRA accessions and should be of same SRA data type, either one of SRA  submission, SRA study, SRA  sample, SRA  experiment and SRA  run
}
  \item{sra_con}{
Connection to the SRAmetadb SQLite database
}
  \item{fileType}{
types of SRA data files, which should be 'sra',  'litesra' or 'fastq'.
}
  \item{srcType}{
source types of SRA data files, which should be 'ftp' or 'fasp'. Aspera is a commercial file transfer protocol that provides better transfer speeds than ftp over long distances. A ascp source is something like: 'anonftp@ftp-trace.ncbi.nlm.nih.gov:/sra/sra-instant/reads/ByExp/litesra/SRX/SRX000/SRX000122/SRR000657/SRR000657.lite.sra'. The sra or lite.sra file can be downloaded through ascp command line (shell), e.g.: ascp -QT -l 200m -i asperaweb_id_dsa.putty <ascp source> <destination folder>.  Aspera ascp command line client can be dowloaded http://www.asperasoft.com/download_connect/ . 
}

}
\details{
Fastq files are hosted at EBI ftp site (ftp://ftp.sra.ebi.ac.uk/vol1/fastq/) and .sra or .lite.sra files are hosted at NCBI ftp site (ftp://ftp-trace.ncbi.nlm.nih.gov/sra/sra-instant/reads/).
}
\value{
Data frame of matched SRA accessions and data file names with ftp or fasp addresses. 
}
\author{
Jack Zhu <zhujack@mail.nih.gov>
}
\seealso{
\code{\link{getSRAfile}}
}
\examples{
	if(file.exists('SRAmetadb.sqlite')) {
		\dontrun{
			library(SRAdb)
			sra_dbname <- 'SRAmetadb.sqlite'	
			sra_con <- dbConnect(dbDriver("SQLite"), sra_dbname)

			## List fastq file ftp addresses associated with "SRA000045"
			listSRAfile (in_acc=c("SRX000122"), sra_con=sra_con, fileType='sra')
			listSRAfile (in_acc=c("SRX000122"), sra_con=sra_con, fileType='sra', srcType='fasp')
		}
	} else {
		print("use getSRAdbFile() to get a copy of the SRAmetadb.sqlite file  and then rerun the example")
	}

}

