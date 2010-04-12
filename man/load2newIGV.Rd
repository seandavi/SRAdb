\name{load2newIGV}
\alias{load2newIGV}
\title{Launch IGV and load BAM files or BAM files in a IGV session file into IGV}
\description{
This function will launch a new IGV and load BAM files into it if it has port 60151 open.
}
\usage{
load2newIGV(files, locus='')
}
\arguments{
  \item{files}{
Character vector of a list BAM format of sequencing data files with path 
}  
\item{locus}{
Locus to display, e.g. chr7:55054218-55206232, TP53. Use any syntax that is valid in the IGV search box.
}
}
\details{
New IGV instance will be launched and BAM files will be loaded. Note: if \code{\link{load2IGV}} will be used to load BAM files to the new launched IGV, a connection port needs to be enabled in the IGV. This is how to enable connection port in the IGV: in IGV, go View->Preferences->Advanced->Enable port and check the checkbox.
}
\references{
http://www.broadinstitute.org/igv/ControlIGV
}
\author{
Jack Zhu <zhujack@mail.nih.gov>
}
\seealso{
\code{\link{startIGV}}, \code{\link{load2IGV}} 
}
\examples{
if(file.exists('SRAmetadb.sqlite')) {

	library(SRAdb)
	sra_dbname <- 'SRAmetadb.sqlite'	
	sra_con <- dbConnect(dbDriver("SQLite"), sra_dbname)
  
	## If  there is no IGV running in your computer, the following statement will launch a new IGV and load BAM files to it:
  	files = list.files(system.file('extdata', package = "SRAdb"), pattern='.bam$', full.names=TRUE)
  	load2newIGV(files, locus='chr1:1-1000000')

} else {
	print("use getSRAdbFile() to get a copy of the SRAmetadb.sqlite file and then rerun the example")
}

}
