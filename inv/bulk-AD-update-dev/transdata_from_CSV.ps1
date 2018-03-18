Import-Module ActiveDirectory
$Userscsv = Import-Csv ;'.\allUsers2.csv'

ForEach ($User in $Userscsv)
{
    Set-ADUser $User.sAMAccountName -Replace @{Division = $User.Division; Office = $User.Office; City = $User.City}
}