$Logfile = ".\time.log"

Function LogWrite
{
   Param ($logstring)

   Add-content $Logfile -value $logstring
}