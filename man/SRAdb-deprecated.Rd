\name{SRAdb-deprecated}
\alias{SRAdb-deprecated}
\title{Deprecated functions in package \sQuote{SRAdb}}
\description{
  The SRAdb package is deprecated and will be removed from Bioconductor.
  Every exported function is deprecated:

  \itemize{
    \item metadata: \code{\link{getSRAdbFile}}, \code{\link{colDescriptions}},
      \code{\link{getSRA}}, \code{\link{sraConvert}},
      \code{\link{entityGraph}}, \code{\link{sraGraph}}
    \item file listing and download: \code{\link{getSRAinfo}},
      \code{\link{listSRAfile}}, \code{\link{getSRAfile}},
      \code{\link{getFASTQinfo}}, \code{\link{getFASTQfile}},
      \code{\link{ascpR}}, \code{\link{ascpSRA}}
    \item IGV: \code{\link{startIGV}}, \code{\link{IGVsocket}},
      \code{\link{IGVsession}}, \code{\link{IGVload}},
      \code{\link{IGVgoto}}, \code{\link{IGVgenome}},
      \code{\link{IGVsnapshot}}, \code{\link{IGVclear}},
      \code{\link{IGVsort}}
  }

  The functions still work during the deprecation period, but they
  issue a warning each time they are called. The SRAmetadb SQLite
  database they rely on is no longer updated; the last build is from
  December 2023, so it does not include SRA records submitted since then.
}
\section{Replacement}{
  OmicIDX (\url{https://omicidx.cancerdatasci.org/}) provides daily
  updated metadata for NCBI SRA, GEO, BioSample and BioProject. From R,
  use the \pkg{omicidxr} package, which replaces SRAdb:

  \preformatted{
    pak::pak("seandavi/omicidxr")
    library(omicidxr)
    con <- omicidx_connect()
  }

  Its \code{sradb} schema follows the SRAdb tables, so most SQL ports by
  prefixing table names, e.g.
  \code{DBI::dbGetQuery(con, "SELECT * FROM sradb.study LIMIT 5")}.

  \tabular{ll}{
    \bold{SRAdb} \tab \bold{omicidxr} \cr
    \code{getSRAdbFile()} and \code{dbConnect()} \tab \code{omicidx_connect()} \cr
    \code{sraConvert(in_acc, out_type, sra_con)} \tab \code{sra_convert(con, in_acc, out_type)} \cr
    \code{getSRA(search_terms, out_types, sra_con)} \tab \code{sra_search(con, query)} \cr
    \code{getSRAinfo()}, \code{listSRAfile()} \tab \code{sra_runs(con, in_acc)} \cr
  }

  \code{sra_runs()} returns run accessions to pass to the SRA Toolkit,
  not file URLs. There are no SRA submission tables in OmicIDX. The
  other SRAdb functions (file download, \code{entityGraph},
  \code{sraGraph}, \code{colDescriptions} and the IGV helpers) have no
  direct equivalent. The migration guide is at
  \url{https://omicidx.cancerdatasci.org/guides/r-omicidxr.html}.
}
\seealso{
  \code{\link{Deprecated}}
}
\keyword{misc}
