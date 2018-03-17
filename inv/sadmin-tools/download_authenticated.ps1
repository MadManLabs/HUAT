$list = @(
    'http://downloads.dell.com/FOLDER04748630M/1/5285-WIN10-A05-3K66F.CAB'
    )

$logFilePath = 'C:\Users\jamesd\Desktop\'
$logFileName = 'DownloadArrayLogFile.txt'
$logFile = $logFilePath+$logFileName
$output = 'C:\Users\jamesd\Desktop\'

$ProxyAuth = Get-Credential -Message 'Proxy authentication required'

$list | ForEach-Object -Process {
    $DLClient = New-Object System.Net.WebClient
    $DLClient.Credentials = New-Object System.Net.NetworkCredential($ProxyAuth.UserName, $ProxyAuth.Password, $env:USERDOMAIN)
    $DellDL = $DLClient.DownloadString($_)
}






