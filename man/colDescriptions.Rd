\name{colDescriptions}
\alias{colDescriptions}
\title{Get column descriptions of SRAmetadb.sqlite}
\description{
  \strong{Deprecated:} SRAdb is deprecated and will be removed from
  Bioconductor; the SRAmetadb database is no longer updated. Use the
  \pkg{omicidxr} package (\url{https://omicidx.cancerdatasci.org/guides/r-omicidxr.html})
  instead. See \link{SRAdb-deprecated}.

Get column descriptions of SRAmetadb.sqlite, including table, field, field data type, description and default values
}
\usage{
colDescriptions( sra_con ) 
}
\arguments{
  \item{sra_con}{Connection of the SRAmetadb SQLite database}
}
\value{
A seven-column data.frame including table_name, field_name, type, description, value_list.
}
\author{
Jack Zhu<zhujack@mail.nih.gov> and Sean Davis <sdavis2@mail.nih.gov>
}
\examples{
## Using the SRAmetadb demo database
  
    library(SRAdb)
	sra_dbname <- file.path(system.file('extdata', package='SRAdb'), 'SRAmetadb_demo.sqlite')	
    sra_con <- dbConnect(dbDriver("SQLite"), sra_dbname)
  
    ## Get column descriptions
    a <- colDescriptions(sra_con=sra_con)[1:5,]

## The actual SRAmetadb sqlite database can be downloaded using function: getSRAdbFile. Warning: the actual SRAmetadb sqlite database is pretty large (> 35GB as of May, 2018) after uncompression. So, downloading and uncompressing of the actual SRAmetadb sqlite could take quite a few minutes depending on your network bandwidth. Direct links for downloading the SRAmetadb sqlite database:  https://s3.amazonaws.com/starbuck1/sradb/SRAmetadb.sqlite.gz https://gbnci-abcc.ncifcrf.gov/backup/SRAmetadb.sqlite.gz
}
\seealso{\link{SRAdb-deprecated}}
\keyword{ database }
\keyword{ SRA }
\keyword{ NCBI }
