. ".\logger.ps1"
. ".\webrequest.ps1"
. ".\start-vms.ps1"
. ".\stop-vms.ps1"

$NrVms = 10
$NrRequests = 100

# $StartupTime = Measure-Command { StartVMs $NrVms }
# LogWrite ("Startup: " + $StartupTime)

For ($i = 10; $i -lt $NrVms + 10 -1; $i++) {
   $j = $i - 9
   Start-Job -FilePath .\webrequest.ps1 -Init ([ScriptBlock]::Create("Set-Location '$pwd'")) -ArgumentList $j, $NrRequests -Name nginx$i
}
Start-Job -FilePath .\webrequest2.ps1 -Init ([ScriptBlock]::Create("Set-Location '$pwd'")) -ArgumentList 10, $NrRequests -Name nginx$i

Wait-Job -Name nginx* | Receive-Job

#For ($i = 10; $i -lt $NrVms + 10; $i++) {
#    Remove-Job -Name nginx$i
#}

#$ShutdownTime = Measure-Command { StopVMs $NrVms }
#LogWrite ("Shutdown: " + $ShutdownTime)
