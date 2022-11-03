#
#   Service restart script
#
$serv = Read-Host -Prompt "Enter the service you wish to restart ";`
$srvc = Get-WmiObject win32_service | Where-Object { $_.Name -eq $serv };`
if ( $srvc.Length -eq 0 ) {`
    Write-Host "The service name entered is incorrect";`
    exit;
}
else {`
    Write-Host "Stopping service $serv...";`
    Write-Host ""
    Stop-Service $serv;`
};
Get-Process | Where-Object { $_.Name -eq $serv } | ForEach-Object { kill $_.Id };`
Write-Host "Starting the service $serv..."
Write-Host ""
Start-Service $serv;
Get-Process | Where-Object { $_.Name -eq $serv } | ForEach-Object { Write-Host $serv " is now running under process "$_.Id }