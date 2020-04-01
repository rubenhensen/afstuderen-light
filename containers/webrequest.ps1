$containerNr = $args[0]
$nrRequests = $args[1]

For ($i = 0; $i -lt $nrRequests; $i++) {
    $time = Measure-Command { Invoke-WebRequest http://localhost:80$containerNr }
    Add-content ".\request-container$($containerNr).log" -value ([string]$time + ",")
}
  
