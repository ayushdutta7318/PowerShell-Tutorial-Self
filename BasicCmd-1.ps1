# Introduction to Powershell: Basic command


# 
# +-----------------------------+
# |  You (the human)            |
# +-----------------------------+
# |  Shell (PowerShell)         |  ← where we work
# +-----------------------------+
# |  Operating System (Windows) |
# +-----------------------------+
# |  Hardware                   |
# +-----------------------------+

# The shell is a tool that lets you talk to the OS using commands instead of clicking buttons.

# CMD (Command Prompt) — old, text-only, limited.

# PowerShell — modern, powerful, scriptable, works with objects, not just text.

# Bash — popular on Linux/macOS; PowerShell is somewhat similar but more Windows/admin focused (though it runs on Linux/macOS too).

# PowerShell is mainly used to:

# Automate repetitive tasks (user creation, backups, reporting, etc.)

# Administer Windows, AD, Azure, servers, etc.

# Collect information and generate reports.



# Basic Commands:

Get-Location;

# powershell cmdlets: built-in cmd. written in verb-noun pattern;

Get-Service;
Get-Location;
# Set-Location C:\
Get-Date;

# other verbs are set, start, stop, restart. other nouns are process, location, date, etc.

# Get-Command: VERY IMP:    

#all commands start with get
# Get-Command Get-*; 


# Get-Command *service*;

# get-help command: you can study how to use a command:
Write-Host "-----------NEW LINE-------------";
Get-Help Get-Service;

# so see cmd eg:

Get-Help Get-Service -Examples;

# Traditional shell pipeline:      PowerShell pipeline:

# Command → text → text → text     Command → objects → objects → objects


# The Pipeline | (just a taste)

# The | character is called the pipeline. It sends the output of one command into the input of another. MORE BAOUT PIPELINE LATER.

Get-Process | Sort-Object CPU -Descending;

Get-ChildItem | Select-Object -First 3;



Get-Process -Id 5716;



