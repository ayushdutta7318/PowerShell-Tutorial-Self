$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "A:\powershell\Powershell-Self\20_ScheduledTask_Automation";

$trigger = New-ScheduledTaskTrigger -AtLogOn;

Register-ScheduledTask -TaskName "CheckAtLogon" -Action $action -Trigger $trigger;