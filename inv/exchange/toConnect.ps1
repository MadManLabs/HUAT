$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://pinvxc101/PowerShell/ -Authentication Kerberos -Credential $UserCredential

<#
To remove session, type:

    Remove-PSSession $Session

#>