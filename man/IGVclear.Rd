\name{IGVclear}
\alias{IGVclear}
\title{
  Clear IGV tracks loaded.
}
\description{
  \strong{Deprecated:} SRAdb is deprecated and will be removed from
  Bioconductor; the SRAmetadb database is no longer updated. Use the
  \pkg{omicidxr} package (\url{https://omicidx.cancerdatasci.org/guides/r-omicidxr.html})
  instead. See \link{SRAdb-deprecated}.

  Clear IGV tracks loaded in the current IGV.
}
\usage{
IGVclear(sock)
}
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

\code{\link{startIGV}}, \code{\link{IGVload}}, \code{\link{IGVgoto}}
}
\examples{
  \dontrun{
  ## Create a file list from example bam files in the package
  exampleBams = file.path(system.file('extdata',package='SRAdb'),
    dir(system.file('extdata',package='SRAdb'),pattern='bam$'))
  
  ##Create a socket connection to IGV
  sock <- IGVsocket()
  ## Load the bam files into IGV
  IGVload(sock, exampleBams)

  ## Clear loaded tracks in the current IGV
  IGVclear(sock)
  }
}
\keyword{ IO }
