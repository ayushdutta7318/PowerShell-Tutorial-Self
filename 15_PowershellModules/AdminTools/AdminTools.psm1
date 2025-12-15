# S3 Add fns in this module:

function Get-DiskFreeSpace{
param(
    [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [string]$DriveName
)

try {
    $drive = Get-PSDrive -Name $DriveName -ErrorAction Stop;
Write-Output "$($drive) has free space in GB: $([math]::Round($drive.Free/1GB, 3))";
}
catch {
    Write-Host "$($_.Exception.message)" -ForegroundColor Red;
}
}

function Get-RunningServices{
    Get-Service | Where-Object {$_.Status -eq "Running"};
}


Export-ModuleMember -Function Get-RunningServices;
