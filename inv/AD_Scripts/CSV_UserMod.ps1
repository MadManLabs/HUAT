Import-Module ActiveDirectory
$Users = Import-csv c:\Users.csv
foreach ($User in $Users)
 {
 Set-ADUser $User.SamAccountName -Manager $User.Newmanager
 }
