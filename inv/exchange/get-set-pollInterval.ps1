## Get poll interval

Get-OabVirtualDirectory | select server,name,pollinterval

## Set poll interval

Get-OabVirtualDirectory | Set-OabVirtualDirectory -PollInterval 120