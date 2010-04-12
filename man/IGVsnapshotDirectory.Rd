\name{IGVsnapshotDirectory}
\alias{IGVsnapshotDirectory}
\title{
  Set the directory to which IGV will save snapshots.
}
\description{
  Set the directory to which IGV will save snapshots.
}
\usage{
IGVsnapshotDirectory(dirname = getwd(), port = 60151, host = "localhost")
}
\arguments{
  \item{dirname}{
  The directory name as a string that will be used by subsequent calls to IGVsnapshot() for saving the snapshot file.
}
  \item{port}{
  The port on which IGV is listening.
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
\code{\link{startIGV}}, \code{\link{IGVsnapshot}}
}
\examples{
IGVsnapshotDirectory()
IGVsnapshot()
dir()
}
\keyword{ IO }
