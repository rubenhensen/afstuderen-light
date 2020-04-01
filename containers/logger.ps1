$Logfile = ".\containter-time.log"

Function LogWrite {
   Param ([String]$logstring)

   Add-content $Logfile -value $logstring
}