IGVsocket <- function(host='localhost', port=60151) {
  sock = try(make.socket(host,port))
  if(inherits(sock,'try-error')) {
    stop(sprintf("Make sure that IGV is running on host %s and that IGV is set to accept commands on port %d",host,port))
  }
  print(sock)
  return(sock)
}

.socketWrite<-
  function(sock,string) {
  print(string)
  write.socket(sock,string)
  response <- read.socket(sock)
  return(response)
}
    

IGVload <-
function (sock, files) {
  if(length(files)<1) stop('Files must be specified')
  message(basename(files))
  .socketWrite(sock,paste('load',paste(files,collapse=','),'\n'))
}

IGVgoto <-
  function(sock,region) {
    .socketWrite(sock, paste('goto',region,'\n'))
  }

IGVgenome <-
  function(sock,genome="hg18") {
    .socketWrite(sock,paste('genome',genome,'\n'))
  }

IGVsnapshot <-
  function(sock,fname="",dirname=getwd()) {
	.socketWrite(sock,paste('snapshotDirectory',dirname,'\n'))
    .socketWrite(sock, paste('snapshot',fname,'\n'))
  }

IGVclear <-
  function(sock) {
    .socketWrite(sock,paste('new \n'))
  }

## option can be base, position, strand, quality, sample, and readGroup
IGVsort <-
  function(sock, option) {
    .socketWrite(sock,paste('sort', option,'\n'))
  }
  
 IGVcollapse <-
  function(sock) {
    .socketWrite(sock,paste('collapse \n'))
  }
