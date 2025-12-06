# Objects in Powershell:

Get-Service | Select-Object -First 5 | Format-Table Status, Name, DisplayName;

# Get-Member: The Most Important Tool: Get-Member: Get-Member (alias: gm) shows you: All properties an object has. All methods it can perform. The object type.

# Syntax:

Get-Process | Get-Member;

# What Are Properties and Methods? Information about the object.Example for a process: Name Id CPU Memory usage.

# Methods: Actions the object can perform. Example methods for processes: Kill() → stops the process. CloseMainWindow(). WaitForExit()

# Using Select-Object to View Specific Properties

Get-Service | Select-Object ServiceName, Name, Status;

Get-Process | Select-Object Name, CPU, Id;

# How to Explore Any Command’s Output

Get-Service | Get-Member;

$serv = Get-Service | Select-Object -First 1;

$serv.CanStop;

Write-Host "-----------------------------------------------";
# $serv.GetType();

# Assignment:

Write-Host "--------------ASSIGNMENT-----------------------";

Get-Process | Select-Object Name, Id;

# Q2

Write-Host "------------------------------------------------";

$files = Get-ChildItem | Where-Object {$_.PSIsContainer -eq $false} | Select-Object Name, Length;

$files;


# Q3

Write-Host "---------------------------------------------------";

$runningServ = Get-Service | Where-Object {$_.Status -eq "Running"};

Write-Output $runningServ;

# Q4

Write-Host "-------------------------------------------------";

$SortServ = Get-Service | Sort-Object Name;

Write-Output $SortServ;

# The $_ Automatic Variable: Inside Where-Object, $_ means: “The current object in the pipeline.”

# //////////////////////////////////////////////

Get-ChildItem -File | Get-Member;

# ############################################

Get-Process | Where-Object {$_.WorkingSet -gt 100MB};