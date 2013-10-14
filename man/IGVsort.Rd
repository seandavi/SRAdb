\name{IGVsort}
\alias{IGVsort}
\title{
  Sort an alignment track by the specified option.
}
\description{
  Using the remote command port of IGV, Sorts an alignment track by the specified option.  Recognized values for the option parameter are: base, position, strand, quality, sample, and readGroup.
}
\usage{
IGVsort(sock, option)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sock}{
  A socket connection to IGV.
}
  \item{option}{
  Recognized values for the option parameter are: base, position, strand, quality, sample, and readGroup.
}
}
\references{
http://www.broadinstitute.org/igv/PortCommands
}
\author{
Jack Zhu<zhujack@mail.nih.gov>
}
\seealso{
\code{\link{startIGV}}, \code{\link{IGVload}}
}
\examples{
  \dontrun{
  sock <- IGVsocket()
  IGVsort(sock, 'position')
  IGVsort(sock, 'base')
  IGVsort(sock, 'sample')
  }
}
\keyword{ IO }
