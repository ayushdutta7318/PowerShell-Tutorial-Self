# Pipeline:

# 3.1 What is the Pipeline (|)? In PowerShell, the pipeline passes objects from one command to the next.

Get-Process | Sort-Object CPU -Descending;

Write-Host "------------------------------------------"

Get-Process -Name msedge;

Get-Service | Where-Object Status -eq "Running" | Select-Object -First 5;

Get-Process | Select-Object -First 5;




################################################################
# Understanding Objects (Very Important)

# When you run: # Get-Process You’re getting objects, each representing a process.

# Each process has properties like: Name, Id, CPU, Memory, Status

# Process Object
# ├── Name     → "chrome"
# ├── Id       → 4532
# ├── CPU      → 12.5
# └── Memory   → 200MB

#Eg:

Get-Process | Select-Object Name,Id,CPU | Select-Object -First 5;

# Filtering With Where-Object: Syntax: Where-Object <Property> <Operator> <Value>
# Common operators:

# Operator	Meaning
# -eq	    equal
# -ne	    not equal
# -gt	    greater than
# -lt	    less than
# -like	    wildcard match
# -contains	contains a value

# Show only running services:

Write-Host "Service objects with running status" -ForegroundColor Green;

Get-Service | Where-Object Status -eq "Running" | Select-Object -First 3;


# show process using mroe than 50mb of memory:

Get-Process | Where-Object WorkingSet -GT 50000000;

# Example 3: Show only items where name starts with “Win”
Write-Host "-----------------------------------------------------";
Get-ChildItem | Where-Object {$_.Name -like "Win*"};

# Filtering with sort-object:

Get-Process | Sort-Object CPU -Descending;

Get-Service | Sort-Object Status;

# Assignment:

Write-Host "----------------------------------------------";

Get-ChildItem | Sort-Object Length -Descending;

# Q2
Write-Host "---------------Q2---------------------------------";
Get-ChildItem | Where-Object {$_.Length -lt 1MB};

# Q3

Write-Host "-----------------------------------------------------";

Get-Process | Sort-Object CPU -Descending | Select-Object -First 10;

# Q4:
Write-Host "-----------------------------------------------------";
Get-Service | Where-Object {$_.Name -like "B*"}; 