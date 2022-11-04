#
#   Extended Man/Get-Help
#
#   Combines Get-Help output with Get-Member (to display command object details)
#
#   Use chk function to check that the command is valid
#
#
Function chk($cmd) {
    $fnd = 0
    Get-Command | 
    ForEach-Object { 
        If ($_.name -eq $cmd ) { 
            $fnd=1 
        } 
    }
    return $fnd
}
if ( $args.length -eq 0) {
    $rcmd = Read-Host "Which command do you want details for"
    $valid=chk($rcmd)
    if ($valid -eq 1) {
        Get-Help $rcmd
        $cmd = "$($rcmd) | Get-Member"
        Invoke-Expression $cmd | Format-Table
    }
    else {
        Write-Host -ForegroundColor Red "Command is not valid"
    }
}
else {
    $valid=chk($args[0])
    if ($valid -eq 1) {
        Get-Help $args[0]
        $cmd = "$($args[0]) | Get-Member"
        Invoke-Expression $cmd | Format-Table
    }
    else {
        Write-Host -ForegroundColor Red "Command is not valid"
    }
}
