# Navigating File Structure:

# C:\
# │
# ├── Users\
# │     ├── YourName\
# │     │      ├── Documents\
# │     │      ├── Downloads\
# │     │      └── Desktop\
# │     └── Public\
# │
# ├── Windows\
# ├── Program Files\
# └── Program Files (x86)\

# Navigating through File structure of Windows:

# to go to a specific location:
# Set-Location -Path "Path"

# Alias of above:
# cd "Path"

# Cmdlet in detail:

# General Structure: Verb-Noun -Parameter Value

# Syntax of above:

Get-ChildItem -Path "C:\Users\Lone_Wolf";


Get-Process -Name AnyDesk;

# Set-Location "C:\Users\Lone_Wolf\Downloads\";

# Assignment:
Get-ChildItem;

Write-Host "------------------------------------------------";

Get-ChildItem -File "A:\powershell\Powershell-Self";

Write-Host "-----------------------------------------------------"

Get-ChildItem -Directory "A:\powershell\Powershell-Self";

Write-Host "-----------------------------------------------------"

Get-ChildItem -Path "C:\Windows" | Select-Object -First 5;

Get-Help Get-ChildItem -Examples;


