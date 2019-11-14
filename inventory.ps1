$pcs = Get-Content -Path 'C:\Users\Xavier Johanis\Desktop\PC Inventory\pc.txt'
$active = Get-Content -Path 'C:\Users\Xavier Johanis\Desktop\PC Inventory\active.txt'
$info = Get-Content -Path 'C:\Users\Xavier Johanis\Desktop\PC Inventory\info.txt'

#$adminaccount = $domain + "\administrator"
$adminaccount = 'user'
$PASSWORD = ConvertTo-SecureString "pass" -AsPlainText -Force
$UNPASSWORD = New-Object System.Management.Automation.PsCredential $adminaccount, $PASSWORD

foreach ($computer in $pcs) {
    if (Test-Connection -ComputerName $computer -Quiet -Count 2) {
        Add-Content -value $computer -Path 'C:\Users\Xavier Johanis\Desktop\PC Inventory\active.txt'
    }
}


foreach ($computer in $active) {
    $OS = Get-WmiObject Win32_OperatingSystem -Computername $computer -Credential $UNPASSWORD
#    $Networks = Get-WmiObject Win32_NetworkAdapterConfiguration -ComputerName $computer | Where-Object {$_.IPEnabled}
#    $IPAddress  = $Networks.IpAddress[0]
#    $MACAddress  = $Networks.MACAddress
}