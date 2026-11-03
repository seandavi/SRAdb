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
## Using the SRAmetadb demo database

	library(SRAdb)
	sra_dbname <- file.path(system.file('extdata', package='SRAdb'), 'SRAmetadb_demo.sqlite')	
	sra_con <- dbConnect(dbDriver("SQLite"), sra_dbname)

	## create a graphNEL object from SRA accessions, which are full text search results of terms 'primary thyroid cell line'
  	acc <- getSRA (search_terms ='MCF7 OR "MCF-7"', out_types=c('sra'), sra_con=sra_con, acc_only=TRUE) 
  	g <- entityGraph(acc)
  	\dontrun{
  	library(Rgraphviz)
  	attrs <- getDefaultAttrs(list(node=list(fillcolor='lightblue', shape='ellipse')))
  	plot(g, attrs= attrs)
  	}

## The actual SRAmetadb sqlite database can be downloaded using function: getSRAdbFile. Warning: the actual SRAmetadb sqlite database is pretty large (> 35GB as of May, 2018) after uncompression. So, downloading and uncompressing of the actual SRAmetadb sqlite could take quite a few minutes depending on your network bandwidth. Direct links for downloading the SRAmetadb sqlite database:  https://s3.amazonaws.com/starbuck1/sradb/SRAmetadb.sqlite.gz https://gbnci-abcc.ncifcrf.gov/backup/SRAmetadb.sqlite.gz
}
