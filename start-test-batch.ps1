Function StartContainers {
  Param ([int]$nrContainers)
  For ($i=10; $i -lt $nrContainers+10; $i++) {
    docker run --name nginx$i -d -p 80$($i):80 afstuderen-light-nginx
  }
}
