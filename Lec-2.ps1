# VARIABLES, LOOPING AND FIRST SCRIPT:

$myName = "Ayush Dutta";

$myName;

$service = Get-Service -Name "BITS"; #Storing Service
$service;

'''
 Now, $service isnt jsut text; its a full object with all the properties and methods we saw with Get-Member. You can interact with it directly:
'''
$service.Status;
# $service.Start();
# $service.Stop();

# The ForEach-Object Loop - Your Assembly Line:

Write-Host "-----------LOOPING---------------"

'''
You used Where-Object to filter. Now youll use ForEach-Object to perform an action on each item in a collection.

Imagine you have three services you want to stop. Instead of running Stop-Service three times, you do it once.

Task: Restart all services whose names start with "WSearch".
(This is the Windows Search service. Its safe to restart and often gets stuck, making it a perfect real-world example.)
'''

Get-Service -Name "WSearch" | ForEach-Object {$_.Refresh()};

# -------------------------------

# ASSIGNMENT:

# Q1. Create a new variable. Store the result of Get-Process -Name "notepad" in a variable called $NotepadProc. Then, use that variable to display the Notepad process's Id and CPU usage.

Write-Host "------------Q1----------------"

$NotepadProcess = Get-Process -Name Notepad;

$NotepadProcess | Where-Object {Write-Host "Process ID: $($_.Id), CPU USage: $($_.CPU)"}

# Q2 Write a script. Create a new script called ProcessReport.ps1 that:
'''
Uses Get-Process to get all processes.

Uses Where-Object to filter for processes using more than 200 MB of working set memory. (Hint: The property is WorkingSet and the value is in bytes. 200 MB = 200 * 1024 * 1024 bytes).

Pipes those high-memory processes to ForEach-Object and writes a line for each one saying: "Process [Name] is using [Memory] MB of RAM."
'''

Write-Host "------------Q2----------------"

Get-Process | Where-Object {$_.WorkingSet -gt 200MB} | ForEach-Object {Write-Host "Process $($_.Name) is using $(($_.WorkingSet)/(1024*1024)) MB of RAM"};