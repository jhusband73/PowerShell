$wshell = New-Object -com wscript.shell
while ((Get-Date) -lt (Get-Date).Date.AddHours(17)) {$wshell.sendkeys("{SCROLLLOCK}") ; Start-Sleep -Seconds 300}
