\name{IGVsocket}
\alias{IGVsocket}
\title{
  Create a Socket Connection to IGV.
}
\description{
  \strong{Deprecated:} SRAdb is deprecated and will be removed from
  Bioconductor; the SRAmetadb database is no longer updated. Use the
  \pkg{omicidxr} package (\url{https://omicidx.cancerdatasci.org/guides/r-omicidxr.html})
  instead. See \link{SRAdb-deprecated}.

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
\link{SRAdb-deprecated}

  \code{\link{startIGV}}, \code{\link{IGVgoto}}
}
\examples{
  \dontrun{
  ## Create a socket connection to IGV
  sock <- IGVsocket()
  }
}
\keyword{ IO }
