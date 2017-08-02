
Try
{
    Import-Module XXXX -ErrorAction Stop
}
Catch
{
    Write-Host "[ERROR] XXXX PS Module not loaded!" -ForegroundColor Red -BackgroundColor Black
    Start-Sleep 3
    Write-Host "Program exiting..."
    Start-Sleep 2
    Exit 1
}
