Function StopVMs {
    Param ([int]$nrVM)
        For ($i = 10; $i -lt $nrVM + 10; $i++) {
            VBoxManage.exe controlvm vmnginx$i poweroff
            VBoxManage.exe unregistervm --delete vmnginx$i
        }
  }
