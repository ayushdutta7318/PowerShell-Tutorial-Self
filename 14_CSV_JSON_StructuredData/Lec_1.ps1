# Working with CSV and json:

# importing json file

<#
14.1 Why Structured Data Matters

In real environments:

HR gives you CSV files (users, assets)

APIs return JSON

Config files are often JSON/XML

Reports are generated as CSV

PowerShell shines here because:

It converts structured data directly into objects.

14.2 Working with CSV Files

CSV = Comma Separated Values
Very common for spreadsheets and reports.
#>


$users = Import-Csv -Path "A:\powershell\Powershell-Self\14_CSV_JSON_StructuredData\users_1.csv"

Write-Output $users;
Write-Output $users.GetType();

# using with pipeline:

$users | Where-Object {$_.Dept -eq "Electronics"};
$users | Where-Object {$_.Age -eq 25};
$users | Where-Object {$_.Name -eq "Ramesh"};

# looping over csv records:

Write-Output "--------------------------";

foreach($user in $users){
    Write-Output "$($user.Name) work in $($user.Dept)";
}

# Export any data as csv:

Get-Process | Select-Object Name, Id, CPU | Export-Csv -Path "A:\powershell\Powershell-Self\14_CSV_JSON_StructuredData\cpu_data_2.csv" -NoTypeInformation;

# append to csv:

$data = Get-Process | Select-Object Name, Id, CPU | Select-Object -First 10;

$data | Export-Csv -Path "A:\powershell\Powershell-Self\14_CSV_JSON_StructuredData\data_3.csv" -NoTypeInformation;

$data_ = Get-Process | Select-Object Name, Id, CPU | Select-Object -Last 10;

$data_ | Export-Csv -Path "A:\powershell\Powershell-Self\14_CSV_JSON_StructuredData\data_3.csv" -Append -NoTypeInformation;

<#

14.3 Creating Custom Objects (Very Important)

You often build your own objects.
#>

$ServerReport = [PSCustomObject]@{
    "Name"= "Server_01";
    "Status"= "Online";
    "CPU" = 45;
}

# exporting above object to csv:

$ServerReport | Export-Csv -Path "A:\powershell\Powershell-Self\14_CSV_JSON_StructuredData\serverdata_4.csv" -NoTypeInformation;

<# JSON: JSON stands for JavaScript Object Notation.

It’s a lightweight, text-based data format used to store and exchange data between systems.

Even though it has JavaScript in the name, JSON is language-independent and widely used in PowerShell, Python, APIs, networking, and web services.
#>

# convert object to json:

$data__ = Get-Service | Select-Object -Property Name, Status | Select-Object -First 10;

$data__ | ConvertTo-Json -Depth 3| Out-File -FilePath "A:\powershell\Powershell-Self\14_CSV_JSON_StructuredData\services_5.json";

# read from json file:

$jsonreport = Get-Content -Path "A:\powershell\Powershell-Self\14_CSV_JSON_StructuredData\services_5.json" | ConvertFrom-Json;

$jsonreport;

<#
| Feature          | CSV   | JSON  |
| ---------------- | ----- | ----- |
| Human readable   | Yes   |  Yes   |
| Supports nesting | No    |  Yes |
| Used in Excel    | Yes   |  No  |
| Used in APIs     | No    | Yes |

#>

