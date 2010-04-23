\name{IGVsession}
\alias{IGVsession}
\title{ Create an IGV session file }
\description{
This function will create an IGV session file
}
\usage{
IGVsession(files, sessionFile, genome='hg18', VisibleAttribute='', destdir=getwd())
}
\arguments{
  \item{files}{
  Character vector of one or more filenames or urls to load - required.
}
  \item{sessionFile}{
  String representing session file name - required
}
  \item{genome}{
  String representing a genome that IGV knows about.
}
  \item{VisibleAttribute}{
  Character vector of one or more IGV Visible Attributes to annotate data tracks to be loaded - optional.
}
  \item{destdir}{
  Path where to save the IGV session file.
}
}
\details{
While the current state of an IGV session can be saved to a named session file that can be opened to restore the IGV session later on, a IGV session file can be manually or programmatically created to achieve more efficient data loading and better control of IGV. IGVsession function was developed to create such IGV session files.  For details please check IGV web site: http://www.broadinstitute.org/igv/ControlIGV
}
\value{
An IGV session file with full file path.
}
\author{
Jack Zhu <zhujack@mail.nih.gov>
}
\seealso{
\code{\link{IGVload}}, \code{\link{IGVgenome}}, \code{\link{IGVgoto}}
}
\examples{
	library(SRAdb)
	exampleBams = file.path(system.file('extdata',package='SRAdb'),
	    dir(system.file('extdata',package='SRAdb'),pattern='bam$'))
	exampleSessionFile <- IGVsession(exampleBams, 'exampleBams.xml');
  	\dontrun{
  	## Start IGV within R. You only need one IGV instance with listen port 60151 open.
    startIGV()
	
	## Wait until IGV fully launched and make sure the listen port for IGV is open (If not configured in IGV, follow these steops: IGV --> Perferences --> Advanced --> Check the checkbox 'Enable port' 60151.)
  	IGVload(exampleSessionFile)
  	}
}
