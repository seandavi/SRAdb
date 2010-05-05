\name{IGVgenome}
\alias{IGVgenome}
\title{
  Set the IGV genome.
}
\description{
  Set the IGV genome via the remote command port.
}
\usage{
IGVgenome(sock, genome="hg18")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sock}{
  A socket connection to IGV.
}
  \item{genome}{
  String representing a genome that IGV knows about.
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
sock <- IGVsocket()
IGVgenome(sock, genome='hg18')
}
}
\keyword{ IO }
