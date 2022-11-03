#
#   Script to get system information about the machine
#
$hst = hostname;`
Write-Host -ForegroundColor "Yellow" "Hostname:  "$hst;`
Get-ComputerInfo |`
  ForEach-Object {`
   Write-Host -NoNewline -ForegroundColor "Red" "OS Name: ";`
   Write-Host -ForegroundColor "Yellow" $_.OSName;`
   Write-Host -NoNewline -ForegroundColor "Red" "OS Version: ";`
   Write-Host -ForegroundColor "Yellow" $_.OSVersion;`
   Write-Host -NoNewline -ForegroundColor "Red" "Install Date: ";`
   Write-Host -ForegroundColor "Yellow" $_.OsInstallDate;`
   Write-Host -NoNewline -ForegroundColor "Red" "Number of Processors: ";`
   Write-Host -ForegroundColor "Yellow" $_.CsNumberOfProcessors;`
   Write-Host -NoNewline -ForegroundColor "Red" "Total Memory: ";`
   Write-Host -ForegroundColor "Yellow" ([math]::round(([Decimal]$_.csTotalPhysicalMemory/1GB),5))" GB";`
   Write-Host -NoNewline -ForegroundColor "Red" "Free Memory: ";`
   Write-Host -ForegroundColor "Yellow" ([math]::round(([Decimal]$_.OsFreePhysicalMemory/1GB),5))" GB";`
   $perc = ([Decimal]$_.OsFreePhysicalMemory/[Decimal]$_.csTotalPhysicalMemory);`
   Write-Host -NoNewline -ForegroundColor "Red" "Free Memory %: ";`
   Write-Host -ForegroundColor "Yellow" ([math]::round($perc,2))"%";`
   Write-Host -NoNewline -ForegroundColor "Red" "Primary Owner Name: ";`
   Write-Host -ForegroundColor "Yellow" $_.csUserName;`
}                 