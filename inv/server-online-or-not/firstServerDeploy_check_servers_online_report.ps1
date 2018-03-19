$firstServerDeploy = @('DINVAPI01',
    'DINVPC11',
    'DINVPC12',
    'SINCIDTT01',
    'SINVAPI01',
    'SINVCMS01',
    'TINVMAP01',
    'TINVSQL01',
    'TINVUTIL02',
    'TINVWEB02',
    'TINVWEB03',
    'CINVCTX01',
    'CINVEBO08',
    'CINVEFO08',
    'DINVEBO08',
    'DINVEFO08',
    'TINVCOG10',
    'TINVCTX11',
    'TINVCTX12',
    'TINVEBO08',
    'TINVEFO08',
    'TINVEWE01',
    'TINVLMS02',
    'TINVMAP02',
    'TINVSPDB10',
    'TINVSPS10',
    'TINVSQLB01',
    'TINVWEB04',
    'DINVCOGTM1',
    'ERPDEMO',
    'DINVSF02',
    'SINVSF02',
    'DINVPC01',
    'DINVPC02',
    'DINVPC03',
    'DINVPC04'
)

$sorted_firstServerDeploy = ($firstServerDeploy | Sort-Object)

$logPath = 'C:\scripts\logs\'
$logName = 'firstServerDeployLog.txt'

$sorted_firstServerDeploy | ForEach-Object -Process `
{
    If (!(Test-Connection -Cn $_ -BufferSize 16 -Count 1 -ea 0 -Quiet))
    {
        "$_ not online" | Out-File -Encoding ascii -Append $logPath$logName
    }
    Else
    {
        Get-WmiObject -Class Win32_Processor -ComputerName $_ | Select-Object AddressWidth
    }
}    