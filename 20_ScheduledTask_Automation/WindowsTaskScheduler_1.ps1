<#
🧩 PART A – WINDOWS TASK SCHEDULER + POWERSHELL

Windows Task Scheduler is the standard way to:

Run scripts at specific times

Run scripts automatically at login or startup

20.1 Manually Create a Task (Graphical Approach)

To understand conceptually:

Open Task Scheduler

Create Task

Set trigger:

At startup

Daily

On event

Set action:
#>

$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "A:\powershell\Powershell-Self\20_ScheduledTask_Automation\execution_sample_2.ps1";

$trigger = New-ScheduledTaskTrigger -Daily -At 07:21pm 

Register-ScheduledTask -TaskName "Services" -Action $action -Trigger $trigger;


# run at startup
$trigger_1 = New-ScheduledTaskTrigger -AtStartup;

#Run at user login:

$trigger_2 = New-ScheduledTaskTrigger -AtLogOn;

# Run With Highest Privileges

Register-ScheduledTask -TaskName "AdminTask" -Action $action -Trigger $trigger -RunLevel Highest;

# Specifying Credentials

$ceredentials =  Get-Credential;

Register-ScheduledTask -TaskName "SecureTask" -Action $action -Trigger $trigger -User $ceredentials.UserName -Password $ceredentials.GetNetworkCredential().Password;

<#
20.14 Don’t Expect GUI

Scheduled tasks run:

in background

without UI

without mapped drives
#>