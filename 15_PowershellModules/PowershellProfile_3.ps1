<#

Profiles:

15.8 What Is a PowerShell Profile?

A profile is a script that runs every time PowerShell starts.

Used for:

Aliases

Functions

Prompt customization

Auto-importing modules
#>

$PROFILE 

Test-Path $PROFILE;

# create your own profile:

# S1 create file:

if(!(Test-Path $PROFILE)){
    New-Item -Path $PROFILE -ItemType File -Force;
}

<#
15.12 Real-World Use Case

Every time you open PowerShell:

Your functions are available

Your tools are loaded

Your environment is consistent

This is how senior admins work efficiently.
#>

