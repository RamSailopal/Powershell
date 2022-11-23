# Powershell

Simple Powershell examples

# Adding script to shell as function when Powershell loads (.bashrc/.profile equivalent)

    New-Item $profile -Type File -Force
    
Navigate to the location of the created file and then create functions i.e.

    Function grep { 
       & 'C:\Documents and Settings\rsailopal\Documents\Powershell1\grep1.ps1' 
    }

# Additional Commands

**List installed software:**

    Get-WMIObject -Class Win32_Product | Select-Object -Property Name
    
**Parse logs:**

    Get-Eventlog -List
    
Get a list of the log types

    Get-WinEvent -Logname Application -MaxEvents 5
   
Get the last 5 application errors


