# Disk usage:

function Show-DiskUsage{
    param(
        [string]$DiskName
    )

    try {
        $logFile = "A:\powershell\Powershell-Self\9_Error_Handling\Disk_Usage_2.log";
        $info = Get-PSDrive -Name $DiskName -ErrorAction Stop;
        Write-Host "Disk free space: $([math]::Round($info.Free/1GB, 2)) GB";
        "Disk free space: $([math]::Round($info.Free/1GB, 2))" | Out-File $logFile -Append;
    }
    catch {
        Write-Host "Error message: $($_.Exception.message)" -ForegroundColor Red;
        "Error message: $($_.Exception.message)" | Out-File $logFile -Append;
    }
}

Show-DiskUsage -DiskName "A";
Show-DiskUsage -DiskName "C";
Show-DiskUsage -DiskName "D";