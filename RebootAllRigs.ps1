$ethoshosts = "192.168.1.201", "192.168.1.202", "192.168.1.203", "192.168.1.204", "192.168.1.205", "192.168.1.206", "192.168.1.207", "192.168.1.208"

$root = Get-Credential root

ForEach-Object -InputObject $ethoshosts {

New-SSHSession $ethoshosts -Credential $root

Invoke-SSHCommand -Command "r 1"



}