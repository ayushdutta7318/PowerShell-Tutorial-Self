# Mini Lab:

# 1.
$services = Get-Service | Select-Object -Property Name,Status | Select-Object -First 20;

$services | Export-Csv -Path "A:\powershell\Powershell-Self\14_CSV_JSON_StructuredData\svcassignment_7.csv" -NoTypeInformation;

# 2.

$svcdata = Import-Csv -Path "A:\powershell\Powershell-Self\14_CSV_JSON_StructuredData\svcassignment_7.csv";

$svcdata | Where-Object {$_.Status -eq "Running"};

# 3.

$serverreport = [PSCustomObject]@{
    ServerName = "Server_03";
    CPU = "I3 6th Gen";
    Storage = 512;
    Memory = 16
}

$serverreport | ConvertTo-Json -Depth 3 | Out-File -FilePath "A:\powershell\Powershell-Self\14_CSV_JSON_StructuredData\serverreport_7.json";

# 4.

$server = Get-Content -Path "A:\powershell\Powershell-Self\14_CSV_JSON_StructuredData\serverreport_7.json" | ConvertFrom-Json;

$server.ServerName;
$server.CPU;
$server.Storage;
$server.Memory;