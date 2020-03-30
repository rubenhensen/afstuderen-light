Function StopContainers {
  Param([int]$NrContainers)
  For ($i=10; $i -lt $NrContainers+10; $i++) {
    docker stop nginx$i
    docker rm nginx$i
}
}
