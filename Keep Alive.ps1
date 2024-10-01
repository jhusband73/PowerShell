# Define the target time (e.g., 3:00 PM)
$targetTime = (Get-Date).Date.AddHours(17)
$wshell = New-Object -com wscript.shell

# Loop while the current time is less than the target time
while ((Get-Date) -lt $targetTime) {
    # Your code here
    $wshell.sendkeys("{SCROLLLOCK}")
    Write-Output "The current time is less than 10:00 AM"
    Start-Sleep -Seconds 300  # Sleep for 10 seconds to avoid a tight loop
}

Write-Output "The current time is now 10:00 AM or later"
