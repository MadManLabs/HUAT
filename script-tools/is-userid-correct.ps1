$global:IsUserIDCorrect = $NULL
$global:BackupUserID = $NULL

global function:UserIDCorrect{
    If($global:IsUserIDCorrect = $NULL){
        Write-Host "UserID is not set"
    }
    ElseIf($global:IsUserIDCorrect = 1){
        $global:BackupUserID = $env:USERNAME
    }Else{
        $global:BackupUserID = Write-Host "Enter UserID to backup"
    }
}