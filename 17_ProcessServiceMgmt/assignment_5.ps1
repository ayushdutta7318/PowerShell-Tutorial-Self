# Assignment 2: Combining Service and Events:

$svc = Get-Service -Name "Spooler";

if($svc.Status -ne "Running"){
    Get-WinEvent -LogName System -MaxEvents 5 | Where-Object Message -Like "*Spooler*";
}

Get-WinEvent -LogName System | Where-Object {$_.LevelDisplayName -eq "Error"} | Select-Object -First 10;