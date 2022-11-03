#
#   Replicates Linux find
#
If ($args.count -eq 0) {
    $path = Read-Host "Please select a path"
    $file = Read-Host "Please select a file"
    $recu = Read-Host "Do you want to do a recursive search (Y/N)" 
}
else {
    $path = $args[0]
    $file = $args[1]
    $recu = $args[2]
}
If ($recu.ToUpper() -eq "Y") {
    Get-ChildItem -Recurse "$path" |
    Where-Object { $_.Name -like "$file" } 
}
else {
    Get-ChildItem "$path" |
    Where-Object { $_.Name -like "$file" } 
}
