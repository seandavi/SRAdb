\name{IGVsnapshot}
\alias{IGVsnapshot}
\title{
  Make a file snapshot of the current IGV screen.
}
\description{
  From the IGV documentation:  "Saves a snapshot of the IGV window to an image file. If filename is omitted, writes a .png file with a filename generated based on the locus. If filename is specified, the filename extension determines the image file format, which must be .png or .eps."
}
\usage{
IGVsnapshot(fname = "", dirname=getwd(), port = 60151, host = "localhost")
}
\arguments{
  \item{fname}{
  The filename to save.  Alternatively, if not specified, IGV will create a filename based on the locus being viewed.
}
  \item{dirname}{
  The directory name as a string for where to save the snapshot file.
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
  ## Create a snapshot of the current IGV window, which is usually the first launched IGV with listen port 60151 open
  IGVsnapshot()
  dir()
  }
}
\keyword{ IO }
