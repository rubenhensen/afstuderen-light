. ".\logger.ps1"
. ".\start-containers.ps1"
. ".\stop-containers.ps1"
. ".\webrequest.ps1"

$NrContainers = 10
$NrRequests = 100

$StartupTime = Measure-Command { StartContainers $NrContainers }
LogWrite ("Startup: " + $StartupTime)

For ($i = 10; $i -lt $NrContainers + 10; $i++) {
    Start-Job -FilePath .\webrequest.ps1 -Init ([ScriptBlock]::Create("Set-Location '$pwd'")) -ArgumentList $i, $NrRequests -Name nginx$i
}
Wait-Job -Name nginx* | Receive-Job

For ($i = 10; $i -lt $NrContainers + 10; $i++) {
    Remove-Job -Name nginx$i
}

$ShutdownTime = Measure-Command { StopContainers $NrContainers }
LogWrite ("Shutdown: " + $ShutdownTime)