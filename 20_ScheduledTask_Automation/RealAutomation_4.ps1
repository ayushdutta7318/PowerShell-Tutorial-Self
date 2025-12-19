# real automatn

$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "A:\powershell\Powershell-Self\20_ScheduledTask_Automation\execution_sample_2.ps1";

$trigger = New-ScheduledTaskTrigger -Daily -At 7am;

Register-ScheduledTask -TaskName ".\execution_sample_2.ps1" -Action $action -Trigger $trigger;

# Use -ExecutionPolicy Bypass safely

powershell.exe -ExecutionPolicy Bypass -File A:\powershell\Powershell-Self\20_ScheduledTask_Automation\RealAutomation_4.ps1;
