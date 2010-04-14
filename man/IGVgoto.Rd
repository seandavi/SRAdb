\name{IGVgoto}
\alias{IGVgoto}
\title{
  Go to a specified region in IGV.
}
\description{
  Using the remote command port of IGV, go to a specified region.
}
\usage{
IGVgoto(region, port = 60151, host = "localhost")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{region}{
  Scrolls to a locus. Use any text that is valid in the IGV search box.
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
\code{\link{startIGV}}, ~~~
}
\examples{
  \dontrun{
  IGVgoto('chr1:1-10000')
  IGVgoto('TP53')
  }
}
\keyword{ IO }
