Function StopContainers {
  Param([int]$NrContainers)
  For ($i=10; $i -le $NrContainers+10; $i++) {
    docker stop nginx$i
    docker rm nginx$i
}
}
