#
#   Get process resource usage CPU/memory order ascending/descending
#
param([String]$type="cpu", [String]$order="Descending")
#
#   Create a command variable holding the command to execute
#
if ($order -notmatch "Descending" -and $order -notmatch "Ascending") {
    $cmd="Get-Process | Sort-Object"
}
elseif ($order -eq "Descending") {
    $cmd="Get-Process | Sort-Object -Descending"
}
else {
    $cmd="Get-Process | Sort-Object"
}
If ($type -eq "cpu") {
    $cmd="$($cmd) -Property cpu"
}
else {
    $cmd="$($cmd) -Property pm"
}
If ($type -eq "cpu") {
    #
    #   Use Invoke-Expression to execute the command held in $cmd
    #
    $objData = @() # Initialise an object
    Invoke-Expression $cmd |  
    ForEach-Object { 
        $cnt++
        If ($_.Path.Length -eq 0) {
            $path="Not Available"
        }
        else {
            $path=$_.Path
        }
        $objData += new-object psobject -Property @{
            id = $_.id
            cpu = $_.CPU
            count  = $cnt
        } 
    }
    $objData |  Format-Table count,cpu,id 
}
else {
    $objData = @() # Initialise an object
    Invoke-Expression $cmd |  
    ForEach-Object {
        $cnt++
        If ($_.Path.Length -eq 0) {
            $path="Not Available"
        }
        else {
            $path=$_.Path
        }
        #
        #   Now add data to the object
        #
        $objData += new-object psobject -Property @{
            id = $_.id
            mem = $_.PM
            count  = $cnt
        } 
    }
    $objData |  Format-Table count,mem,id 
}