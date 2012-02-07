\name{entityGraph}
\alias{entityGraph}
\title{ Create a new graphNEL object from an input entity matrix or data.frame }
\description{
This function will create a  new graphNEL object from an input entity matrix or data.frame
}
\usage{
entityGraph(df)
}
\arguments{
  \item{df}{
A matrix or data.frame
}
}
\details{
A graphNEL object with edgemode='directed' is created from input data.frame and the \code{\link{plot}} function will draw a graph
}
\value{
A graphNEL object with edgemode='directed'
}
\author{
Jack Zhu <zhujack@mail.nih.gov> and Sean Davis <sdavis2@mail.nih.gov>
}
\seealso{
\code{\link{getSRA}}, \code{\link{sraConvert}}, \code{\link{sraGraph}}
}
\examples{
if(file.exists('SRAmetadb.sqlite')) {

	library(SRAdb)
	sra_dbname <- 'SRAmetadb.sqlite'	
	sra_con <- dbConnect(dbDriver("SQLite"), sra_dbname)

	## create a graphNEL object from SRA accessions, which are full text search results of terms 'colon cancer'
  	acc <- getSRA (search_terms ='primary thyroid cell line', out_types=c('sra'), sra_con=sra_con, acc_only=TRUE) 
  	g <- entityGraph(acc)
  	\dontrun{
  	library(Rgraphviz)
  	attrs <- getDefaultAttrs(list(node=list(fillcolor='lightblue', shape='ellipse')))
  	plot(g, attrs= attrs)
  	}

} else {
  	print("use getSRAdbFile() to get a copy of the SRAmetadb.sqlite file
and then rerun the example")
}

}
