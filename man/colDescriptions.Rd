\name{colDescriptions}
\alias{colDescriptions}
\title{Get column descriptions of SRAmetadb.sqlite}
\description{
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
if(file.exists('SRAmetadb.sqlite')) {
  
  library(SRAdb)
  sra_dbname <- 'SRAmetadb.sqlite'	
  sra_con <- dbConnect(dbDriver("SQLite"), sra_dbname)
  
  ## Get column descriptions
  a <- colDescriptions(sra_con=sra_con)[1:5,]

} else {
  print("use getSRAdbFile() to get a copy of the SRAmetadb.sqlite file and then rerun the example")
}
}
\keyword{ database }
\keyword{ SRA }
\keyword{ NCBI }
