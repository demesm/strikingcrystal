#$ethoshosts = "192.168.1.201", "192.168.1.202", "192.168.1.203", "192.168.1.204", "192.168.1.205", "192.168.1.206", "192.168.1.207", "192.168.1.208"

$ethos = Get-Credential ethos
$root = Get-Credential root

$ethoshosts = "192.168.1.201"

$sessionid=0

ForEach-Object -InputObject $ethoshosts {

Set-SCPFile -LocalFile "C:\Users\demes\Desktop\ethOS Mining Files\minerprocess.php" -RemotePath "/opt/ethos/lib/" -ComputerName $ethoshosts -Credential $root
Set-SCPFile -LocalFile "C:\Users\demes\Desktop\ethOS Mining Files\ethos-readconf" -RemotePath "/opt/ethos/sbin/" -ComputerName $ethoshosts -Credential $root
Set-SCPFile -LocalFile "C:\Users\demes\Desktop\ethOS Mining Files\claymore-music.stub.conf" -RemotePath "/home/ethos/" -ComputerName $ethoshosts -Credential $ethos
}


while ($sessionid -le 0) {ForEach-Object -InputObject $ethoshosts {

New-SSHSession $ethoshosts -Credential $ethos

Invoke-SSHCommand -SessionId $sessionid -Command "cp -R /opt/miners/claymore /opt/miners/claymore-music; mv /opt/miners/claymore-music/claymore /opt/miners/claymore-music/claymore-music; sudo chmod 0644 /home/ethos/claymore-music.stub.conf; sudo chmod 0644 /opt/ethos/lib/minerprocess.php; sudo chmod 0755 /opt/ethos/sbin/ethos-readconf; cat /home/ethos/claymore-music.stub.conf > /opt/miners/claymore-music/config.txt; r 1;"

$sessionid++

}
}