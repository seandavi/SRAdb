\name{IGVclear}
\alias{IGVclear}
\title{
  Clear IGV tracks loaded.
}
\description{
  Clear IGV tracks loaded in the current IGV.
}
\usage{
IGVclear(port = 60151, host = "localhost")
}
\arguments{
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
Jack Zhu <zhujack@mail.nih.gov>
}
\seealso{
\code{\link{startIGV}}, \code{\link{IGVload}}, \code{\link{IGVgoto}}
}
\examples{
  \dontrun{
  ## Create a file list from example bam files in the package
  exampleBams = file.path(system.file('extdata',package='SRAdb'),
    dir(system.file('extdata',package='SRAdb'),pattern='bam$'))
  
  ## Load the bam files into IGV
  IGVload(exampleBams)

  ## Clear loaded tracks in the current IGV
  IGVclear()
  }
}
\keyword{ IO }
