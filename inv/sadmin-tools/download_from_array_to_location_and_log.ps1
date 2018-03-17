###########################################################
# AUTHOR  : Danijel James
# WEBSITE : invocare.com.au
# CREATED : 2018-03-16 
# UPDATED : 2018-03-17
# VERSION : 1.4
# COMMENT : Download list of files as specified in array
###########################################################

# Define array of files to download
$downloadArray = @(
    'http://downloads.dell.com/FOLDER04748630M/1/5285-WIN10-A05-3K66F.CAB',
    'http://downloads.dell.com/FOLDER04663816M/1/5289-WIN10-A04-X3VK6.CAB',
    'http://downloads.dell.com/FOLDER04784633M/1/5480-WIN10-A06-GHK5Y.CAB',
    'http://downloads.dell.com/FOLDER04785170M/1/7280-WIN10-A06-VC3WX.CAB',
    'http://downloads.dell.com/FOLDER04784067M/1/7480-WIN10-A06-WMKPH.CAB',
    'http://downloads.dell.com/FOLDER02532596M/1/E5440-win8-A03-3FGVJ.CAB',
    'http://downloads.dell.com/FOLDER04495605M/1/E5450_5450-WIN10-A07-WHK99.CAB',
    'http://downloads.dell.com/FOLDER03647285M/1/E6330-WIN10-A01-XD69T.CAB',
    'http://downloads.dell.com/FOLDER03647870M/1/E6430-WIN10-A01-6GCWC.CAB',
    'http://downloads.dell.com/FOLDER04089669M/1/E7240-WIN10-A03-03T4T.CAB',
    'http://downloads.dell.com/FOLDER04557804M/1/E7250_7250-WIN10-A06-70P79.CAB',
    'http://downloads.dell.com/FOLDER04559920M/1/E7270-WIN10-A08-Y7XF9.CAB',
    'http://downloads.dell.com/FOLDER04590466M/1/E7450-WIN10-A06-R2J9C.CAB',
    'http://downloads.dell.com/FOLDER04559716M/1/E7470-WIN10-A08-V1P8F.CAB',
    'http://downloads.dell.com/FOLDER04807087M/1/7050-WIN10-A06-21FV9.CAB',
    'http://downloads.dell.com/FOLDER03656814M/1/3010-Win10-A01-XM7K2.CAB',
    'http://downloads.dell.com/FOLDER03830407M/1/3020-WIN10-A02-7J3R5.CAB',
    'http://downloads.dell.com/FOLDER04677947M/1/3040-WIN10-A10-X57PH.CAB',
    'http://downloads.dell.com/FOLDER04805013M/1/3050-WIN10-A06-P0JW7.CAB'
    )


# Define download directory
$DLPath = "C:\Users\jamesd\Desktop\DELL\"

# Define logfile name
$logFileName = "DownloadArrayLogFile.txt"

# Set $logFile
$logFile = $DLPath+$logFileName

$startTime = Get-Date

$endTime = Get-Date

$timeDifference = "Hours:$(($endTime).Subract($startTime).Hours) Mins:$(($endTime).Subract($startTime).Minutes) Seconds:$(($endTime).Subract($startTime).Seconds)"

$downloadArray | ForEach-Object -Process {

    # Set start time of iteration
    $startTime

    # Download file with WebRequest
    Invoke-WebRequest -Uri "$_" -OutFile "$DLPath$(split-path -path -leaf)"

    # End time of iteration
    $endTime
    
    # Write file download completion message
    Write-Host "$(Split-Path -Path $_ -Leaf) downloaded in $timeDifference"

    # Append $logFile with completion message
    "$(Split-Path -Path $_ -Leaf) downloaded in $timeDifference" | Out-File -Encoding ascii -Append $logFile
}

# Extract CAB downloads
$CABFileList = $(dir $DLPath).Name

$expandCABArray = @()

$CABFileList | ForEach-Object -Process {

    # Add list of CAB files to $expandCABArray
    $expandCABArray += $_
}

For ($eachCAB in $expandCABArray)
{
    Expand $DLPath$eachCAB -F:* $DLPath
    Write-Host "$eachCAB has been expanded"
}
