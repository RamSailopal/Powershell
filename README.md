# Powershell

Simple Powershell examples

# Adding commands to shell as function when Powershell loads

    New-Item $profile -Type File -Force
    
Navigate to the location of the created file and then create functions i.e.

   Function grep { 
       
