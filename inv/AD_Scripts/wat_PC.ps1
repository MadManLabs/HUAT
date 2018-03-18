<#
function Get-UserID-Invocare
{
    while($i -ne "x")
    {
        Write-Host 'Press "X" to exit loop'
        $i = Read-Host -Prompt 'Computer to check'
        Get-WmiObject -Class win32_computersystem -ComputerName $i | select username
    }
    clear
}
Get-UserID-Invocare
#>

function Get_Logged_On_User
{
    $i = Read-Host -Prompt 'Computer to check'
    Get-WmiObject -Class win32_computersystem -ComputerName $i | select username
}

import-module activedirectory
function Computer_Name
{
    $r = Read-Host -Prompt 'Partial computer name'
    Get-ADComputer -Filter {name -like "*$r*"} | select Name
    ##Get-WmiObject -Class win32_computersystem -ComputerName $l | select username
}


function wat_pc
{
    param
    (
        [Parameter(
            Position=0,
            Mandatory=$true,
            ValueFromPipeline=$true)
        ]
        [String]$ComputerNumberPartialMatch
    )
    begin
    {
        Write-Host '==========================='
    }

    process
    {
        Get-ADComputer -Filter {name -like "*$ComputerNumberPartialMatch*"} | select Name
    }
}

