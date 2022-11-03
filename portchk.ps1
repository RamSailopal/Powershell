#
#   Get a list of listening ports
#
#   Run  .\portchk.ps1 | Get-Unique to remove duplicates
#
netstat -a | ForEach-Object { 
    $cnt++
    If ($cnt -gt 4) {
        $text=$_.Replace(" ",";")
        $bits=$text.Split(";")
        $bits1=$bits[6].Split(":")
        if ( $bits[$bits.Length-1] -eq "LISTENING")  {
            Write-Output $bits1[1]
        }
    }
}