\name{getFASTQinfo}
\alias{getFASTQinfo}
\title{Get SRA fastq file information and associated meta data from EBI ENA}
\description{
This function gets SRA fastq file information and essential associated meta data from EBI ENA web site ( http://www.ebi.ac.uk/ena/data/view/reports/sra/fastq_files/ ) for SRA accessions given.
}
\usage{
getFASTQinfo( in_acc, sra_con, srcType = 'ftp' )
}
\arguments{
  \item{in_acc}{
character vector of SRA accessions that could be be in one or more SRA sata types: study, sample, experiment and/or run.
}
  \item{sra_con}{
Connection to the SRAmetadb SQLite database
}
  \item{srcType}{
 option for listing either 'ftp' or 'fasp' addresses. The default is 'ftp'.  
}
}
\details{
EBI ENA web site ( http://www.ebi.ac.uk/ena/data/view/reports/sra/fastq_files/ ) is the souce for parsing infromation from, which is updated and verified daily.  Ftp or fasp addresses got from this funciton can be used in either \code{\link{getFASTQfile}} or \code{\link{getSRAfile}} to  download the files.  
}
\value{
A data.frame of  ftp/fasp inftomation ( addresses, file size, read number, etc) and associated meta data ( study, sample, experiment,      run, organism, instrument.platform, instrument.model, library.name, library.layout, library.source, library.selection, run.read.count, run.base.count, etc. ).
}
\author{
Jack Zhu <zhujack@mail.nih.gov>
}
\seealso{
\code{\link{getFASTQfile}}, \code{\link{listSRAfile}}, \code{\link{getSRAfile}}
}
\examples{
if(file.exists('SRAmetadb.sqlite')) {
	\dontrun{
	library(SRAdb)
	sra_dbname <- 'SRAmetadb.sqlite'	
	sra_con <- dbConnect(dbDriver("SQLite"), sra_dbname)	
	getFASTQinfo( in_acc = c("SRR000648","SRR000657"), sra_con, srcType = 'ftp' )
	getFASTQinfo( in_acc = c("SRR000648","SRR000657"), sra_con, srcType = 'fasp' )
	}
} else {
	print("Use getSRAdbFile() to get a copy of the SRAmetadb.sqlite file  and then rerun the example")
}
}

