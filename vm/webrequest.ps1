$vmNr = $args[0]
$nrRequests = $args[1]


For ($i = 0; $i -lt $nrRequests; $i++) {
    $time = Measure-Command { Invoke-WebRequest http://192.168.56.10$vmNr }
    Add-content ".\request-vm$($vmNr).log" -value ([string]$time + ",")
}
  
