
$LogPath = "d:\jeff's\my music" # replace this with your root path...
Get-ChildItem -LiteralPath $LogPath -Recurse | Where-Object {
    $_.PSIsContainer -and `
    @(Get-ChildItem -LiteralPath $_.Fullname -Recurse | Where { -not $_.PSIsContainer }).Count -eq 0 } |
    Remove-Item -Recurse -force -WhatIf

# get-childitem "d:\jeff's\my music" -include *.jpg -recurse -hidden -force | foreach ($_) {remove-item $_.fullname}
#get-childitem "d:\jeff's\my music" -include *.dat -recurse -hidden | foreach ($_) {remove-item $_.fullname -Force}

#get-childitem "d:\jeff's\my music" -include *.mp3 -recurse  | foreach ($_) {move-item -Path "d:\Jeff's\my music"}
