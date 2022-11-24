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

**Remote Connections**

    Enable-PSRemoting -Force
    
 Enable remote connection to machine
 
    $hostnme = hostname
    
    Invoke-Command -ComputerName $hostnme -ScriptBlock { hostname }
    
 Execute the command **hostname** on the localhost
 
    $hostnme = hostname
    
    $s = New-PSSession -ComputerName $hostnme
    
    Invoke-Command -Session $s { hostname }
    
 Execute the same command creating a persistent session (variables created remotely are persisted across Invoke-Command calls)
 
 **Environmental Variables**
 
    Get-ChildItem -Path Env:
    
 Get environmental variables.
 
 
    
 
 


