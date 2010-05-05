\name{IGVgoto}
\alias{IGVgoto}
\title{
  Go to a specified region in IGV.
}
\description{
  Using the remote command port of IGV, go to a specified region.
}
\usage{
IGVgoto(sock, region)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sock}{
  A socket connection to IGV.
}
  \item{region}{
  Scrolls to a locus. Use any text that is valid in the IGV search box.
}
}
\references{
http://www.broadinstitute.org/igv/PortCommands
}
\author{
Sean Davis <sdavis2@mail.nih.gov>
}
\seealso{
\code{\link{startIGV}}, \code{\link{IGVload}}
}
\examples{
  \dontrun{
  sock <- IGVsocket()
  IGVgoto(sock, 'chr1:1-10000')
  IGVgoto(sock, 'TP53')
  }
}
\keyword{ IO }
