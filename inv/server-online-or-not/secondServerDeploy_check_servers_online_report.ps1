$secondServerDeploy = @('PINVAPI01',
    'PINVERSGW01',
    'PINVHUB01',
    'PINVRSOLID01',
    'PINVADC01',
    'PINVCMS01',
    'PINVIDT01',
    'PINVHPSIM01',
    'PINVEBR01',
    'PINVEBRPX01',
    'PINVEMC01',
    'PINVSF03',
    'PINVCHQ01',
    'PINVCOGSPSS02',
    'PINVFRX01',
    'PINVMAP01',
    'PINVMGT01',
    'PINVCTX43',
    'PINVCTX45',
    'PINVCTX46',
    'PINVCTX47',
    'PINVCTX49',
    'PINVCTX52',
    'PINVCTX53',
    'PINVCTX54',
    'PINVCTX55',
    'PINVCTX56',
    'PINVERM02',
    'PINVEVDA01',
    'PINVEVJR01',
    'PINVFLW08',
    'PINVKVS02',
    'PINVMDM01',
    'PINVMDM02',
    'PINVMGT02',
    'PINVREP08',
    'PINVUTIL02',
    'PINVUTIL03',
    'PINVXMP02',
    'PINVMGTSQL01',
    'PINVOSCE01',
    'PINVPRINT01',
    'PINVUTIL04',
    'PINVUTIL05',
    'PINVUTIL06',
    'PINVMEDC01',
    'PINVWSUS02',
    'PINVCAG02',
    'PINVCAG03',
    'PINVGW02',
    'WNBull-FMS',
    'PINVESX01-09',
    'PINVDOC01',
    'PINVCOGSPSS01',
    'PINVCOG01',
    'PINVSQL01',
    'PINVWEB01',
    'PINVWEB02',
    'PINVWEB05',
    'PINVAD801',
    'PINVAD802',
    'PINVCOGAP01',
    'PINVCOGCM01',
    'PINVCOGDC01',
    'PINVEBO08',
    'PINVEFO08',
    'PINVFP02',
    'PINVFP03',
    'PINVLIC01',
    'PINVLMS02',
    'PINVSF01',
    'PINVSPDB10',
    'PINVSPS10',
    'PINVSQLB01',
    'PINVPCUBE02',
    'PINVCOG02'
)

$sorted_secondServerDeploy = ($secondServerDeploy | Sort-Object)

$logPath = 'C:\scripts\logs\'
$logName = 'secondServerDeployLog.txt'
$successLogName = 'successLog2.txt'

$sorted_firstServerDeploy | ForEach-Object -Process `
{
    If (!(Test-Connection -Cn $_ -BufferSize 16 -Count 1 -ea 0 -Quiet))
    {
        "$_ not online" | Out-File -Encoding ascii -Append $logPath$logName
    }
    Else
    {
        Write-Host "$_ $(Get-WmiObject -Class Win32_Processor -ComputerName $_ | Select-Object AddressWidth)"## | Out-File -Encoding ascii -Append $logPath$successLogName
    }
}    