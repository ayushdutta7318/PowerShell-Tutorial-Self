# Event log Mnagement:

<#
17.9 Understanding Event Logs

Common logs:

| Log         | Purpose                  |
| ----------- | ------------------------ |
| Application | App errors & events      |
| System      | OS, drivers, services    |
| Security    | Logins, failures (audit) |

#>

# viewing event logs:

Get-WinEvent -ListLog *;

# Read recent system events

Get-WinEvent -LogName System -MaxEvents 10;

# read error only:
Write-Output "---------------------------------------------------";

Get-WinEvent -LogName System | Where-Object {$_.LevelDisplayName -eq "error"};

# filter  events by date created:

Get-WinEvent -LogName System | Where-Object TimeCreated -gt (Get-Date).AddDays(-1);

# specific event by event id:

Write-Output "----------------------------------------------";

Get-WinEvent -LogName System | Where-Object -Id -eq 0;

