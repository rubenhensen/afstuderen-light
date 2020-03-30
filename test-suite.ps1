. ".\logging.ps1"
. ".\start-test-batch.ps1"
. ".\stop-test-batch.ps1"
. ".\wget-test.ps1"

$NrContainers = 5
$NrRequests = 50

$StartupTime = Measure-Command {StartContainers $NrContainers}
LogWrite ("Startup: " + $StartupTime)

	
Start-Job -FilePath .\wget-test.ps1 -Init ([ScriptBlock]::Create("Set-Location '$pwd'")) -ArgumentList 10, $NrRequests 
Start-Job -FilePath .\wget-test.ps1 -Init ([ScriptBlock]::Create("Set-Location '$pwd'")) -ArgumentList 11, $NrRequests
Start-Job -FilePath .\wget-test.ps1 -Init ([ScriptBlock]::Create("Set-Location '$pwd'")) -ArgumentList 12, $NrRequests
Start-Job -FilePath .\wget-test.ps1 -Init ([ScriptBlock]::Create("Set-Location '$pwd'")) -ArgumentList 13, $NrRequests
Start-Job -FilePath .\wget-test.ps1 -Init ([ScriptBlock]::Create("Set-Location '$pwd'")) -ArgumentList 14, $NrRequests

Pause

$ShutdownTime = Measure-Command {StopContainers $NrContainers}
LogWrite ("Shutdown: " + $ShutdownTime)