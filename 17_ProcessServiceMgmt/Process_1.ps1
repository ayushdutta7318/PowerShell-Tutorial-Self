# Process and service management:

<#
17.1 Understanding Processes vs Services
🧠 Simple distinction
Item	Description
Process	A running program (e.g., chrome.exe)
Service	A background process managed by Windows (e.g., Spooler)

A service usually runs as a process, but with extra control (start/stop/restart automatically).
#>

Get-Process; #to fetch all processes

# view specific process:
Write-Output "-----------------------------------------------------";

Get-Process -Name AnyDesk;

# sort by cpu usage:

$cpuUsage = Get-Process | Sort-Object -Descending CPU;

Write-Output $cpuUsage;

# Select useful fields:
Write-Output "------------------------------------------------";

$proc = Get-Process | Select-Object -Property Name, CPU, Id, WorkingSet | Select-Object -First 10;

Write-Output $proc;

# select specific property of a process:

$proc_1 = Get-Process -Name AnyDesk | Select-Object -Property WorkingSet;

Write-Output "The memory consumtion of AnyDesk is: $($proc_1.WorkingSet/1MB)";

# Find Resource hungry process:

$proc_2 = Get-Process | Where-Object {$_.WorkingSet -gt 100MB};

$proc_2;

# top 5 cpu consumers:

Write-Output "---------------------------------------------------";

$proc_3 = Get-Process | Sort-Object -Descending CPU | Select-Object -First 5;

$proc_3;


# Stop process:

$msedge = Get-Process -Name "msedge";

$msedge;

Stop-Process -Name $msedge;

