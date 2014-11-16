##This function is to download files using Aspera's ascp command line program
## due to complexity with options in ascp and installation difference between different platforms, this funciton allow use to supply main ascp comands.
## ascpCMD: string - user supply ascp comands and options, e.g. "ascp -QT -l 300m -i /etc/aperaweb_id_dsa.putty" or"qsub -cwd -b y ascp -QT -l 300m -i /etc/aperaweb_id_dsa.putty",
## ascpSource: a vector of ascp sources, e.g. era-fasp@fasp.sra.ebi.ac.uk:/vol1/ERA012/ERA012008/sff/library08_GJ6U61T06.sff
## destDir: where to save downloaded files

## my Mac example:
# ascpCMD = 'ascp -QT -l 300m -i /usr/local/aspera/connect/etc/asperaweb_id_dsa.putty'
# ascpSource = 'anonftp@ftp-trace.ncbi.nlm.nih.gov:/sra/sra-instant/reads/ByExp/sra/SRX/SRX000/SRX000122/SRR000657/SRR000657.sra'
# ascpSource = 'era-fasp@fasp.sra.ebi.ac.uk:vol1/fastq/SRR000/SRR000648/SRR000648.fastq.gz'
# ascpR( ascpCMD, ascpSource, destDir=getwd() )
#ascp -QT -l 300m -i /usr/local/aspera/connect/etc/asperaweb_id_dsa.putty anonftp@ftp-trace.ncbi.nlm.nih.gov:/sra/sra-instant/reads/ByExp/sra/SRX/SRX000/SRX000122/SRR000657/SRR000657.sra .
#/usr/local/bin/ascp -QT -l 300m -i /usr/local/aspera/connect/etc/asperaweb_id_dsa.putty era-fasp@fasp.sra.ebi.ac.uk:vol1/fastq/SRR000/SRR000648/SRR000648.fastq.gz  .

ascpR <- function ( ascpCMD, ascpSource, destDir = getwd() ) {
	for( src in ascpSource ) {
		ascp_cmd <- paste( ascpCMD, src, destDir, sep = ' ' )
		system( ascp_cmd )
	}	
}

