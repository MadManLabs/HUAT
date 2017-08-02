$global:DriveSelected = $NULL

function global:WhichDrive2BackupTo{
    Write-Host "From the drives listed,"
    Write-Host "select the drive to backup"
    $global:DriveSelected = Read-Host "your data to:"
    Write-Host ""
    Write-Host "Drive selected is" $global:DriveSelected
}