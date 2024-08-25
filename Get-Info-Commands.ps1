
(Get-WmiObject -Class Win32_operatingSystem).caption

([WMI]'').ConvertToDateTime((Get-WmiObject Win32_OperatingSystem).InstallDate)

Get-CimInstance -ClassName Win32_OperatingSystem | Select LastBootUpTime

Get-winevent -FilterHashtable @{logname='system'; id=1074} # | select timecreated
Get-winevent -FilterHashtable @{logname='system'; id=6008} #| select timecreated
Get-winevent -FilterHashtable @{logname='system'; id=4624} #| select timecreated
Get-winevent -FilterHashtable @{logname='system'; id=4672} #| select timecreated
Get-WinEvent -FilterHashtable @{logname = 'System'; id = 1074, 6005, 6006, 6008} -MaxEvents 6 | Format-Table -wrap

Get-WindowsCapability -Online | ? Name -like 'OpenSSH*' 

Enter-PSSession servername -EnableNetworkAccess

Exit-PSSession


#--------------------------------------------------------------------------
# Get- terminal server license info

$obj = gwmi -namespace "Root/CIMV2/TerminalServices" Win32_TerminalServiceSetting
$obj.GetSpecifiedLicenseServerList()
$obj.LicensingType

# ---------------------------------------------------


$InstalledSoftware = Get-ChildItem "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall"
foreach($obj in $InstalledSoftware){write-host $obj.GetValue('DisplayName') -NoNewline; write-host " - " -NoNewline; write-host $obj.GetValue('DisplayVersion')}


# Get reboot time and last 5 hotfixes
 Get-CimInstance -ClassName win32_operatingsystem | select csname, lastbootuptime
 Get-Hotfix | Sort-Object -Property InstalledOn -Descending | Select-Object -First 5


$servers = get-content "C:\test\new 4.txt"
$currentdate = Get-Date
foreach($server in $servers){
$Bootuptime = (Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName $server).LastBootUpTime
   $uptime = $currentdate - $Bootuptime
   Write-Output "$server Uptime : $($uptime.Days) Days, $($uptime.Hours) Hours, $($uptime.Minutes) Minutes"
}



