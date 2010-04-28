\name{startIGV}
\alias{startIGV}
\title{Start IGV from R with different amount maximum memory support}
\description{
This function is to start the Integrative Genomics Viewer (IGV) within R, which is a high-performance visualization tool for interactive exploration of large, integrated datasets. It supports a wide variety of data types including sequence alignments, microarrays, and genomic annotations. In the SRAdb, functions of load2IGV and load2newIGV can be used to load BAM format of sequencing data into IGV conveniently. 
}
\usage{
startIGV(memory = "mm", devel=FALSE)
}
\arguments{
  \item{memory}{
Maximum usable memory support for the IGV to be launched, which is defined as the following: 'mm' - 1.2 GB 
, 'lm' - 2 GB, 'hm' - 10 GB, '' - 750 MB
}
  \item{devel}{
Start development version of IGV.
}
}
\details{
IGV with 1.2 GB maximum usable memory ('mm') is usually for 32-bit Windows; IGV with 2 GB maximum usable memory ('lm') is usually for 32-bit MacOS; IGV with 10 GB maximum usable memory is for large memory 64-bit java machines; IGV with 750 MB ('') is sufficient for most applications. The IGV will be launched through Java Web Start. For details about how IGV is launched or have problems to launch it, please refer to this site: http://www.broadinstitute.org/igv/StartIGV . Note: if \code{\link{IGVload}} will be used to load BAM files to the new launched IGV, a connection port needs to be enabled in the IGV. This is how to enable connection port in the IGV: in IGV, go View->Preferences->Advanced->Enable port and check the checkbox.

}
\references{
http://www.broadinstitute.org/igv/
}
\author{
Jack Zhu
}
\seealso{
\code{\link{IGVload}}, \code{\link{IGVgoto}}, \code{\link{IGVgenome}}
}
\examples{
## launch IGV with 1.2 GB maximum usable memory support
\dontrun{startIGV("lm"))}
}


