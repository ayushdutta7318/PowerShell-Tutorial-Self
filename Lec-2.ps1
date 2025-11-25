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