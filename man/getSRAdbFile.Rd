\name{getSRAdbFile}
\alias{getSRAdbFile}
\title{Download and unzip last version of SRAmetadb.sqlite.gz from the server}
\description{
  This function is the standard method for downloading and unzipping the
  most recent SRAmetadb SQLite file from the server.
}
\usage{
getSRAdbFile(destdir = getwd(), destfile = "SRAmetadb.sqlite.gz",
             method)
}
\arguments{
  \item{destdir}{The destination directory of the downloaded file}
  \item{destfile}{The filename of the downloaded file. This filename
    should end in ".gz" as the unzipping assumes that is the case}
  \item{method}{Character vector of length 1, passed to the identically
    named argument of \code{\link{download.file}}.}
}
\value{
  Prints some diagnostic information to the screen.

  Returns the local filename for use later.
}
\author{
Jack Zhu <zhujack@mail.nih.gov>, Sean Davis <sdavis2@mail.nih.gov>
}
\examples{
## the SRAmetadb demo database can be used to test
sra_dbname <- file.path(system.file('extdata', package='SRAdb'), 'SRAmetadb_demo.sqlite')	

\dontrun{geometadbfile <- getSRAdbFile()}
## Direct links for downloading the SRAmetadb sqlite database:  https://s3.amazonaws.com/starbuck1/sradb/SRAmetadb.sqlite.gz https://gbnci-abcc.ncifcrf.gov/backup/SRAmetadb.sqlite.gz
}
