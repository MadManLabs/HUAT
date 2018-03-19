try {
        $colItems = Get-ChildItem $folder.FullName -Recurse -ErrorAction STOP | Measure-Object -property length -sum -ErrorAction SilentlyContinue
        $size = "{0:N2}" -f ($colItems.sum / 1MB) + " MB"
    } catch {
        Write-Warning "Access Denied to $folder.Name"
        $size = "N/A"
        Continue
    }
