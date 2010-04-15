\name{IGVgenome}
\alias{IGVgenome}
\title{
  Set the IGV genome.
}
\description{
  Set the IGV genome via the remote command port.
}
\usage{
IGVgenome(genome="hg18", port = 60151, host = "localhost")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{genome}{
  String representing a genome that IGV knows about.
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
\code{\link{startIGV}}
}
\examples{
\dontrun{
IGVgenome(genome='hg18')
}
}
\keyword{ IO }
