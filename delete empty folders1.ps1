$items = Get-ChildItem -Recurse
# delete empty folders

foreach($item in $items)
{
      if( $item.PSIsContainer )
      {
            $subitems = Get-ChildItem -Recurse -Path $item.FullName
            if($subitems -eq $null)
            {
                  "Remove item: " + $item.FullName
                  Remove-Item $item.FullName
            }
            $subitems = $null
      }
}
