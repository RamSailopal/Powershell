#
#   Linux grep with parameters
#
#   Execute with .\grep1.ps1 -text "text.*" -path "C:\"-recursive "Y" 
#
#   Set up parameters path, text and recursive as type String and default value of ""
#
#
#
param ([String] $path="", [String] $text="", [String] $recursive="")

If ($path -eq "") {
    $path = Read-Host "Please select a path"
}
If ($text -eq "") {
    $Strng = Read-Host "Please select text to search all text file for"
}
else {
    $Strng = $text
}
If ($recursive -eq "") {
    $recu = Read-Host "Do you want to do a recursive search (Y/N)"   
}
else {
    $recu = $recursive
}


If ($recu.ToUpper() -eq "Y") {
    Get-ChildItem -Recurse "$path*.txt" | 
    ForEach-Object { Select-String -Path "$_" -Pattern $Strng }
}
else {
    Get-ChildItem "$path*.txt" | 
    ForEach-Object { Select-String -Path "$_" -Pattern $Strng }
}


