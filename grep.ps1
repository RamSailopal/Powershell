#
#   Replicates Linux grep
#
If ($args.count -eq 0) {
    $path = Read-Host "Please select a path"
    $Strng = Read-Host "Please select text to search all text file for"
    $recu = Read-Host "Do you want to do a recursive search (Y/N)" 
}
else {
    $path = $args[0]
    $Strng = $args[1]
    $recu = $args[2]
}
If ($recu.ToUpper() -eq "Y") {
    Get-ChildItem -Recurse "$path*.txt" | 
    ForEach-Object { Select-String -Path "$_" -Pattern $Strng }
}
else {
    Get-ChildItem "$path*.txt" | 
    ForEach-Object { Select-String -Path "$_" -Pattern $Strng }
}
