function global:ExitClause{
    Clear-Host
    Write-Host ""
    Write-Host "Invalid entry received!" -ForegroundColor Red -BackgroundColor Black
    Write-Host ""
    Write-Host "Exiting script!" -ForegroundColor DarkYellow -BackgroundColor Black
    Start-Sleep -s 5
    exit
}