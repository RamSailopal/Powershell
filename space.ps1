#
#   Get the space on each drive
#
$hst=hostname
Write-Host -ForegroundColor "Red" "Hostname:   "$hst
Get-PSDrive |`
 Where-Object { $_.Free -gt 0 } |`
  ForEach-Object {`
    $perspace = ((([decimal]$_.Free/1GB)/(([decimal]$_.Used + [decimal]$_.Free)/1GB))*100);`
    Write-Host -ForegroundColor "yellow" "Drive:    "$_.Name"   Free:   "($_.Free/1GB)"GB    Used:   "($_.Used/1GB)"GB   %Free   "((($_.Free/1GB)/(($_.Used + $_.Free)/1GB))*100)"%";`
    If ([decimal]$perspace -lt 5 ) {`
        Write-Host -BackgroundColor "Red" "SPACE ON "$_.Name" IS LOW !!!!!";`        
    }`
    }