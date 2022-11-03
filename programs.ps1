#
#   Script to get a list of the installed packages
#
Write-Host -ForegroundColor "Blue" "Hostname:"
Write-Host ""
hostname
Write-Host "";
Get-WMIObject -Query "SELECT * FROM Win32_Product" |`
    ForEach-Object {`
        Write-Host -ForegroundColor "Yellow" "Name:  "$_.Name;`
        Write-Host -ForegroundColor "Red" "Version:  "$_.Version;`
        Write-Host "";`
    }