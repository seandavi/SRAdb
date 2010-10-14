\name{IGVsocket}
\alias{IGVsocket}
\title{
  Create a Socket Connection to IGV.
}
\description{
  Create a Socket Connection to IGV by a specified port and host.
}
\usage{
IGVsocket(host='localhost', port=60151)
}
\arguments{
  \item{host}{
  The name of remote host where IGV is running. 
}
  \item{port}{
  The port to connect to/listen on.
}
}
\references{
http://www.broadinstitute.org/igv/PortCommands
}
\author{
Sean Davis <sdavis2@mail.nih.gov>
}
\seealso{
  \code{\link{startIGV}}, \code{\link{IGVgoto}}
}
\examples{
  \dontrun{
  ## Create a socket connection to IGV
  sock <- IGVsocket()
  }
}
\keyword{ IO }
