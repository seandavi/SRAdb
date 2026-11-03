\name{IGVcollapse}
\alias{IGVcollapse}
\title{
  Collapse tracks in the IGV
}
\description{
  \strong{Deprecated:} SRAdb is deprecated and will be removed from
  Bioconductor; the SRAmetadb database is no longer updated. Use the
  \pkg{omicidxr} package (\url{https://omicidx.cancerdatasci.org/guides/r-omicidxr.html})
  instead. See \link{SRAdb-deprecated}.

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
\link{SRAdb-deprecated}

\code{\link{startIGV}}, \code{\link{IGVload}}
}
\examples{
  \dontrun{
  sock <- IGVsocket()
  IGVcollapse(sock)
  }
}
\keyword{ IO }
