\name{IGVcollapse}
\alias{IGVcollapse}
\title{
  Collapse tracks in the IGV
}
\description{
  Using the remote command port of IGV, this function collapses tracks in the IGV.
}
\usage{
IGVcollapse(sock)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sock}{
  A socket connection to IGV.
}
}
\references{
http://www.broadinstitute.org/igv/PortCommands
}
\author{
Jack Zhu <zhujack@mail.nih.gov>
}
\seealso{
\code{\link{startIGV}}, \code{\link{IGVload}}
}
\examples{
  \dontrun{
  sock <- IGVsocket()
  IGVcollapse(sock)
  }
}
\keyword{ IO }
