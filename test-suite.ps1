. ".\logging.ps1"
. ".\start-test-batch.ps1"
. ".\stop-test-batch.ps1"

$NrContainers = 5

$StartupTime = Measure-Command {StartContainers $NrContainers}
LogWrite ("Startup: " + $StartupTime)

$ShutdownTime = Measure-Command {StopContainers $NrContainers}
LogWrite ("Shutdown: " + $ShutdownTime)