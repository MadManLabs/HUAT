Try
{
    Import-Module ActiveDirectory -ErrorAction Stop
}
Catch
{
    Write-Host "[ERROR] ActiveDirectory PS Module not loaded!" -ForegroundColor Red -BackgroundColor Black
    Start-Sleep 3
    Write-Host "Program exiting..."
    Start-Sleep 2
    Exit 1
}

<#
DECLARE GLOBAL VARIABLES
#>

$global:UserID = $NULL
$global:MachineNameLike = $NULL


<#
FUNCTIONS
#>

function Show-Menu
{
     param (
           [string]$Title = 'Find Machine or User'
     )
     cls
	 Write-Host ""
     Write-Host "================ $Title ================"
	 Write-Host ""
     Write-Host "1: Press 'M' to find machine by number"
     Write-Host "2: Press 'U' to user currently logged"
     Write-Host "   into machine"
     Write-Host "3: Press 'B' to find machine and then"
     Write-Host "   currently logged on user"
     Write-Host "Q: Press 'Q' to quit."
}




do
{
    Show-Menu
    $input = Read-Host "Please make a selection"
    switch ($input)
    {
        'm'
        {
            Clear-Host
            $MachineID = Read-Host "Enter machine number: "
            Get-ADComputer -Filter {Name -Like "*$MachineID*"} | Select Name     
        }
        'u'
        {
            Clear-Host
            $MachineID = Read-Host "Enter machine number: "
            $output.UserName = (Get-WmiObject -Class win32_computersystem -ComputerName $comp).UserName
            [PSCustomObject]$output
        }
        'b'
        {
            Clear-Host
            $strComputer = Read-Host "Enter machine number: "
            $Var = GWMI -Comp $strComputer -CL Win32_ComputerSystem
            "Machine Name: " + $Var.Name + "   User Name: " + $Var.UserName
            <#
            $output.UserName = (Get-ADComputer -Filter {Name -Like "*$MachineID*"} | Select Name | Get-WmiObject -Class win32_computersystem -ComputerName $_).UserName
            [PSCustomObject]$output
            #>
        }
        'q'
        {
            return
        }
    }
    pause
}
until ($input -eq 'q')