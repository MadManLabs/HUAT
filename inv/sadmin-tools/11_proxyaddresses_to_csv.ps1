﻿Get-ADUser <#-identity 'jamesd'#> -Filter * -Properties proxyaddresses | select Name,@{L='ProxyAddress_1';E={$_.proxyaddresses[0]}},@{L='ProxyAddress_2';E={$_.ProxyAddresses[1]}},@{L='ProxyAddress_3';E={$_.ProxyAddresses[2]}},@{L='ProxyAddress_4';E={$_.ProxyAddresses[3]}},@{L='ProxyAddress_5';E={$_.ProxyAddresses[4]}},@{L='ProxyAddress_6';E={$_.ProxyAddresses[5]}},@{L='ProxyAddress_7';E={$_.ProxyAddresses[6]}},@{L='ProxyAddress_8';E={$_.ProxyAddresses[7]}},@{L='ProxyAddress_9';E={$_.ProxyAddresses[8]}},@{L='ProxyAddress_10';E={$_.ProxyAddresses[9]}},@{L='ProxyAddress_11';E={$_.ProxyAddresses[10]}} | Export-Csv -Path C:\data_dump\proxyaddresses.csv -NoTypeInformation