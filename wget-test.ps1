$containerNr = $args[0]
$nrRequests = $args[1]


    For ($i=0; $i -lt $nrRequests; $i++) {
        $time = Measure-Command {wget http://localhost:80$containerNr}
        Add-content ".\time.log" -value ("Container nginx" + $containerNr + " Time: " + $time)
    }
  
