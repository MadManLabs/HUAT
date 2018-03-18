## Change password to default and user must change password at logon
Set-ADAccountPassword $UserID -NewPassword (ConvertTo-SecureString -AsPlainText -String "W3lcome_1" -Force)
Set-ADUser $UserID -ChangePasswordAtLogon $true

## Unlock account
Unlock-ADAccount $UserID

## Find all empty GPO
Get-ADGroup -Filter * | where {-Not($_ | Get-ADGroupMember)} | Select Name


## Add group member
Add-ADGroupMember "Head Office" -Members $UserID
    ## All users in city Sydney
    Add-ADGroupMember "Head Office" -Member (Get-ADUser -Filter "city -eq 'Sydney'")
    ## Reverse entry
    Get-ADUser -Filter "city -eq 'Sydney'" | ForEach 
    {
        Add-ADGroupMember "Head Office" -Member $_
    }


## Enumerate through group
Get-ADGroupMember "Head Office"
    ## Recursive
    Get-ADGroupMember "Head Office" -Recursive | Select DistinguishedName


Get-ADUser -Filter * -SearchBase "OU=OU Name,DC=Domain,DC=Com" | % {
    $name = "$($_.GivenName.ToLower()).$($_.SurName.ToLower())"
    $upnsuffix = ($_.UserPrincipalName -split "@")[1]
    $upn = "$name@$upnsuffix"
    $_ | Set-ADUser -SamAccountName $name -UserPrincipalName $upn
}






