##This function is to download SRA data files using Aspera's ascp command line program
## in_acc: vector of SRA accessions
## ascpCMD: string - user supply ascp comands and options, e.g. "ascp -QT -l 300m -i /etc/aperaweb_id_dsa.putty" or"qsub -cwd -b y ascp -QT -l 300m -i /etc/aperaweb_id_dsa.putty",
## ascpSource: a vector of ascp sources, e.g. era-fasp@fasp.sra.ebi.ac.uk:/vol1/ERA012/ERA012008/sff/library08_GJ6U61T06.sff
## destDir: where to save downloaded files

## example:
# in_acc = c("SRR000648","SRR000657")
# ascpCMD = 'ascp -QT -l 300m -i /usr/local/aspera/connect/etc/asperaweb_id_dsa.putty'
# ascpSource = 'anonftp@ftp-trace.ncbi.nlm.nih.gov:/sra/sra-instant/reads/ByExp/litesra/SRX/SRX000/SRX000122/SRR000657/SRR000657.lite.sra'
# ascpSource = 'era-fasp@fasp.sra.ebi.ac.uk:vol1/fastq/SRR000/SRR000648/SRR000648.fastq.gz'
# ascpSRA (in_acc, sra_con, ascpCMD, fileType='fastq', destDir=getwd()) 

#ascp -QT -l 300m -i /usr/local/aspera/connect/etc/asperaweb_id_dsa.putty anonftp@ftp-trace.ncbi.nlm.nih.gov:/sra/sra-instant/reads/ByExp/litesra/SRX/SRX000/SRX000122/SRR000657/SRR000657.lite.sra .
#/usr/local/bin/ascp -QT -l 300m -i /usr/local/aspera/connect/etc/asperaweb_id_dsa.putty era-fasp@fasp.sra.ebi.ac.uk:vol1/fastq/SRR000/SRR000648/SRR000648.fastq.gz  .

ascpSRA <- function (in_acc, sra_con, ascpCMD, fileType='litesra', destDir=getwd()) {	
	sraFiles = listSRAfile (in_acc, sra_con, fileType, srcType='fasp') 
	ascpR ( ascpCMD, sraFiles$fasp, destDir )
	return (sraFiles)
}

