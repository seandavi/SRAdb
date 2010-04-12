.safeSocketConnect <- function(host,port) {
  sock = try(make.socket(host,port))
  if(inherits(sock,'try-error')) {
    stop(sprintf("Make sure that IGV is running on host %s and that IGV is set to accept commands on port %d",host,port))
  }
  return(sock)
}

.socketWrite<-
  function(string,host,port) {
  sock=.safeSocketConnect(host,port)
  print(string)
  write.socket(sock,string)
  close.socket(sock)
}
    

IGVload <-
function (files, port=60151, host='localhost') {
  if(length(files)<1) stop('Files must be specified')
  message(basename(files))
  .socketWrite(paste('load',paste(files,collapse=','),'\n'),host,port)
}

IGVgoto <-
  function(region,port=60151,host='localhost') {
    .socketWrite(paste('goto',region,'\n'),host,port)
  }

IGVgenome <-
  function(genome="hg18",port=60151,host='localhost') {
    .socketWrite(paste('genome',genome,'\n'),host,port)
  }

IGVsnapshot <-
  function(fname="",port=60151,host='localhost') {
    .socketWrite(paste('snapshot',fname,'\n'),host,port)
  }

IGVsnapshotDirectory <-
  function(dirname=getwd(),port=60151,host='localhost') {
    .socketWrite(paste('snapshotDirectory',dirname,'\n'),host,port)
  }
