Get-process *explorer* | Select-Object Id | ForEach-Object { Stop-Process $_.Id }
