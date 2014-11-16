\name{SRAdb-package}
\alias{SRAdb-package}
\alias{SRAdb}
\docType{package}
\title{Query NCBI SRA metadata within R or from a local SQLite database}
\description{
The Sequence Read Archive (SRA) represents largest public repository of sequencing data from the next generation of sequencing platforms including Roche 454 GS System, Illumina Genome Analyzer, Applied Biosystems SOLiD System, Helicos Heliscope, and others. However, finding data of interest can be challenging using current tools. SRAdb is an attempt to make access to the metadata associated with submission, study, sample, experiment and run much more feasible. This is accomplished by parsing all the NCBI SRA metadata into a SQLite database that can be stored and queried locally. SRAdb is simply a thin wrapper around the SQLite database along with associated tools and documentation. Fulltext search in the package make querying metadata very flexible and powerful.  SRA data files (sra or sra-lite) can be downloaded for doing alignment locally. Available BAM files in local or in the Meltzerlab sraDB can be loaded into IGV for visualization easily. The SQLite database is updated regularly as new data is added to SRA and can be downloaded at will for the most up-to-date metadata. 
}
\details{
\tabular{ll}{
Package: \tab SRAdb\cr
Type: \tab Package\cr
Version: \tab 1.9.2\cr
Date: \tab 2012-02-13\cr
License: \tab What license is it under?\cr
LazyLoad: \tab yes\cr
}
}
\author{
Jack Zhu and Sean Davis

Maintainer: Jack Zhu <zhujack@mail.nih.gov>
}
\references{
http://gbnci.abcc.ncifcrf.gov/backup/SRAmetadb.sqlite.gz http://dl.dropbox.com/u/51653511/SRAmetadb.sqlite.gz
}
\keyword{ package }
\examples{
if(file.exists('SRAmetadb.sqlite')) {
  
  library(SRAdb)
  sra_dbname <- 'SRAmetadb.sqlite'	
  sra_con <- dbConnect(dbDriver("SQLite"), sra_dbname)
  
  ## Get column descriptions
  a <- colDescriptions(sra_con=sra_con)[1:5,]
  
  ## Convert SRA experiment accessions to other types
  b <- sraConvert( in_acc=c(" SRR000137", "SRR000138 "), out_type=c('sample'), sra_con=sra_con )
  
  ## Fulltext search SRA meta data using SQLite fts3 module
  rs <- getSRA (search_terms ='breas* NEAR/2 can*', out_types=c('run','study'), sra_con=sra_con)
  rs <- getSRA (search_terms ='breast', out_types=c('run','study'), sra_con=sra_con)
  rs <- getSRA (search_terms ='"breas* can*"', out_types=c('study'), sra_con=sra_con) 
  rs <- getSRA (search_terms ='MCF7 OR "MCF-7"', out_types=c('sample'), sra_con=sra_con) 
  rs <- getSRA (search_terms ='study_title: brea* can*', out_types=c('run','study'), sra_con=sra_con)  
  rs <- getSRA (search_terms ='study_title: brea* can*', out_types=c('run','study'), sra_con=sra_con, acc_only=TRUE) 

  ## List fastq file ftp or fasp addresses associated with "SRX000122"
  listSRAfile (in_acc = c("SRX000122"), sra_con = sra_con, fileType = 'sra')
  listSRAfile (in_acc = c("SRX000122"), sra_con = sra_con, fileType = 'sra', srcType='fasp')
  
  ## Get file size and date from NCBI ftp site for available fastq files associated with "SRS012041","SRS000290" 
  \dontrun{  
  getSRAinfo (in_acc=c("SRS012041","SRS000290"), sra_con=sra_con, sraType='sra')
  }

  ## Download sra files from NCBI SRA using ftp protocol:
  getSRAfile( in_acc = c("SRR000648","SRR000657"), sra_con = sra_con, destDir = getwd(), fileType = 'sra' )
  ## Download fastq files from EBI using ftp protocol:
  getSRAfile( in_acc, sra_con, destDir = getwd(), fileType = 'fastq', srcType = 'ftp', makeDirectory = FALSE, method = 'curl', ascpCMD = NULL )
   
  ## Download fastq files from EBI  ftp siteusing fasp protocol:
  \dontrun{
  ascpCMD <-  'ascp -QT -l 300m -i /usr/local/aspera/connect/etc/asperaweb_id_dsa.putty'
  getSRAfile( in_acc, sra_con,  fileType = 'fastq', srcType = 'fasp',  ascpCMD = ascpCMD )}
   
  ## Start IGV from R if no IGV running
  \dontrun{startIGV(memory='mm')}

  ## load BAM files to IGV
  \dontrun{
  exampleBams = file.path(system.file('extdata',package='SRAdb'), dir(system.file('extdata',package='SRAdb'),pattern='bam$'))
  sock <- IGVsocket()
  IGVload(sock,exampleBams)
  }
  ## Change the IGV genome
  \dontrun{
  IGVgenome(sock,genome='hg18')
  }
  ## Go to a specified region in IGV
  \dontrun{
  IGVgoto(sock,'chr1:1-10000')
  IGVgoto(sock,'TP53')
  }

  ## Make a snapshot of the current IGV window
  \dontrun{  
  IGVsnapshot(sock)
  dir()
  }
  
  ## create a graphNEL object from SRA accessions, which are full text search results of terms 'primary thyroid cell line'
  g <- sraGraph('primary thyroid cell line', sra_con)
  
  \dontrun{
  library(Rgraphviz)
  attrs <- getDefaultAttrs(list(node=list(fillcolor='lightblue', shape='ellipse')))
  plot(g, attrs=attrs)
  }
  
  dbDisconnect(sra_con) 

} else {
  print("use getSRAdbFile() to get a copy of the SRAmetadb.sqlite file
and then rerun the example")
}
}

