. ".\logging.ps1"
. ".\wget-test.ps1"

$NrVms = 2
$NrRequests = 100

For ($i=10; $i -lt $NrVms + 10; $i++) {
    Start-Job -FilePath .\wget-test.ps1 -Init ([ScriptBlock]::Create("Set-Location '$pwd'")) -ArgumentList $i+1, $NrRequests -Name nginx$i
}
Wait-Job -Name nginx* | Receive-Job

For ($i=10; $i -lt $NrVms + 10; $i++) {
    Remove-Job -Name nginx$i
}
