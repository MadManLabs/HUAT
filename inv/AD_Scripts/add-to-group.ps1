Import-module ActiveDirectory
foreach($member in (get-content	c:\computers.txt)){
    Add-AdGroupmember "D04-UAC-Exempt" -Members $member -Erroraction Continue -Verbose
}
