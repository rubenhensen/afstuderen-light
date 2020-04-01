Function StartVMs {
    Param ([int]$nrVM)
        For ($i = 10; $i -lt $nrVM + 10; $i++) {
            VBoxManage.exe import .\Debian.ova -vsys 0 --vmname vmnginx$i 
            VBoxManage.exe startvm vmnginx$i --type headless
        }
  }
