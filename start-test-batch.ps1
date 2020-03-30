Function StartContainers {
  Param ([int]$nrContainers)
  Write-Output ("Starting " + $nrContainers + " containers")
  For ($i=10; $i -le $nrContainers+10; $i++) {
    docker run --name nginx$i -d -p 80$($i):80 afstuderen-light-nginx
  }
  
}
