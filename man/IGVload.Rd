\name{IGVload}
\alias{IGVload}
\title{
  Load data into IGV via remote port call.
}
\description{
  Loads data via a remote call to IGV.  IGV is limited to accepting filenames only.
}
\usage{
IGVload(files, port = 60151, host = "localhost")
}
\arguments{
  \item{files}{
  Character vector of one or more filenames with full path or urls to load. Among supported file types are BAM and IGV session file, for other file types  please check IGV web site: http://www.broadinstitute.org/igv/ControlIGV.
}
  \item{port}{
  The port to which IGV is listening.
}
  \item{host}{
  The host on which IGV is running.
}
}
\references{
http://www.broadinstitute.org/igv/PortCommands
}
\author{
Sean Davis <sdavis2@mail.nih.gov>
}
\seealso{
  \code{\link{startIGV}}
}
\examples{
  \dontrun{
  ## Create a file list from example bam files in the package
  exampleBams = file.path(system.file('extdata',package='SRAdb'),
    dir(system.file('extdata',package='SRAdb'),pattern='bam$'))
  
  ## Load the bam files into IGV
  IGVload(exampleBams)
  }
}
\keyword{ IO }
