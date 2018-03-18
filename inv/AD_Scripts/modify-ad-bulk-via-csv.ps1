Import-Module ActiveDirectory

Param(
  [string]$csvFile##,
##  [string]$filePath
)

<#
Using Param
-----------

call PS1 file and add positional parameters by identifier marked

ie - ./modify-ad-bulk-via-csv.ps1 -csvFile ./file.csv

the parameter must match what is declared
#>


Import-Csv "$csvFile" | ForEach-Object
{
    $userPrincipal = $_."samAccountName" + "@invocare.com.au"
    New-ADUser -Name $_.Name -Path $_."ParentOU" -samAccountName $_."samAccountName" -UserPrincipalName $userPrincipal -AccountPassword (ConvertTo-SecureString "P@ssword1" -AsPlainText -Force) -ChangePasswordAtLogon $True -Enabled $True
    Add-ADGroupMember "Domain Admins" $_."samAccountName"
}


Get-ADUser -Filter * -SearchBase "OU=OU Name,DC=Domain,DC=Com" | % {
    $name = "$($_.GivenName.ToLower()).$($_.SurName.ToLower())"
    $upnsuffix = ($_.UserPrincipalName -split "@")[1]
    $upn = "$name@$upnsuffix"
    $_ | Set-ADUser -SamAccountName $name -UserPrincipalName $upn
}


<#
CSV Example

Name    samAccountName    ParentOU
====    ==============    ========
test1   test1a            OU=HR,DC=test,DC=com
test2   test2a            OU=HR,DC=test,DC=com
test3   test3a            OU=HR,DC=test,DC=com
#>