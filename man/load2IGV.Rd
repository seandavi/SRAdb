\name{load2IGV}
\alias{load2IGV}
\title{Load BAM files or BAM files in a IGV session file into IGV}
\description{
This function will merge to or replace current IGV session with input BAM files
}
\usage{
load2IGV(files, locus='', genome='', Merge=TRUE, port='60151')
}
\arguments{
  \item{files}{
Character vector of a list BAM format of sequencing data files with path 
}
  \item{locus}{
Locus to display, e.g. chr7:55054218-55206232, TP53. Use any syntax that is valid in the IGV search box.
}
  \item{genome}{
Name of reference genome build used by IGV. If empty, IGV used 'hg18' as default.
}
  \item{Merge}{
logical, if TRUE, input BAM files will be merged current IGV session, otherwise,  input BAM files will replace current IGV session
}
 \item{port}{
'60151' is the default port for IGV. If it was configured differently in IGV, this value here needs to be changed accordingly.
}
}
\details{
An IGV instance need to exist and port of 60151 needs to be open.  If there are multiple IGV instances, this function will only deal with the first one (with port 60151 open). This is how to enable connection port in the IGV: in IGV, go View->Preferences->Advanced->Enable port and check the checkbox.
}
\references{
http://www.broadinstitute.org/igv/ControlIGV
}
\author{
Jack Zhu <zhujack@mail.nih.gov>
}
\seealso{
\code{\link{startIGV}}, \code{\link{load2newIGV}}
}
\examples{
  ## load BAM files to IGV
  
  files = list.files(system.file('extdata', package = "SRAdb"), pattern='.bam$', full.names=TRUE)
  \dontrun{load2IGV(files, locus='chr1:1-1000000', Merge=TRUE)}
  \dontrun{load2IGV(files, locus='HES4', Merge=FALSE)}

}
