# BASIC CMDS:



Get-Help Get-Service;

'''
Verb-noun format: Get(verb)-Service(noun)

with get -help, get-service we can see the name, syntax of how the cmdlet works. 

but we can do better
'''

Get-Help Get-Service -Examples;
Get-Help Get-Service -Full;

# ----------------------------------------------------


# OUR FIRST REAL CMD: GET-SERVICE

Get-Service;  # outputs all the services whether running or stopped on your pc.

# PIPELINE: Takes output from the cmd on its left and passses it to the cmd on the right.

Write-Host "---------------------------------------------------------"

Get-Service | Where-Object {$_.Name -eq "wuauserv"}

Write-Host "------------------------------------------------------------"

Get-Service | Where-Object {$_.DisplayName -like "*Update*"};

# GET-MEMBER: How to know how many properties are on each object of the get-service. So we use get-member:

Write-Host "------------------------------------------------------------";

Get-Service | Get-Member;

# Lets use a property:


