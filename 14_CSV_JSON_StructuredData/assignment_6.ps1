# Assignment:

# we have to preapre report for free space in each local drive:

$report = foreach ($d in Get-PSDrive -PSProvider FileSystem) {
    $Drive = $d.Name;
    $FreeGB = [math]::Round($d.Free / 1GB, 2);
    $UsedGB = [math]::Round($d.Used / 1GB, 2);

    [PSCustomObject]@{
        "DriveName" = $Drive;
        "FreeSpace" = $FreeGB;
        "UsedSpace" = $UsedGB;
    }
}

$report;

$report | Export-Csv -Path "A:\powershell\Powershell-Self\14_CSV_JSON_StructuredData\drive_report_6.csv" -NoTypeInformation;

