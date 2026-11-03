\name{IGVload}
\alias{IGVload}
\title{
  Load data into IGV via remote port call.
}
\description{
  \strong{Deprecated:} SRAdb is deprecated and will be removed from
  Bioconductor; the SRAmetadb database is no longer updated. Use the
  \pkg{omicidxr} package (\url{https://omicidx.cancerdatasci.org/guides/r-omicidxr.html})
  instead. See \link{SRAdb-deprecated}.

  Loads data via a remote call to IGV.
}
\usage{
IGVload(sock, files)
}
\arguments{
  \item{sock}{
  A socket connection to IGV.
}
  \item{files}{
  Character vector of one or more filenames with full path or urls to load. Among supported file types are BAM and IGV session file, for other file types  please check IGV web site: http://www.broadinstitute.org/igv/ControlIGV.
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
  ## Create a file list from example bam files in the package
  exampleBams = file.path(system.file('extdata',package='SRAdb'),
    dir(system.file('extdata',package='SRAdb'),pattern='bam$'))
  
  ## Create a socket connection to IGV
  sock <- IGVsocket()
  ## Load the bam files into IGV
  IGVload(sock, exampleBams)
  }
}
\keyword{ IO }
