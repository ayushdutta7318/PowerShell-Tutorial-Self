# Modules:

<#

15.1 What Is a Module?

A module is a packaged collection of:

Functions

Variables

Scripts

Think of it like a toolbox.

Diagram:

PowerShell
└── Module (Toolbox)
    ├── Get-Health
    ├── Restart-SafeService
    └── Get-DiskStatus

#>

# Viewing installed module:

$installedModules = Get-Module -ListAvailable;

Write-Output $installedModules;

# loded module only:

Write-Output "-----------------------------------------";
$loadedModules = Get-Module;

Write-Output $loadedModules;

# import module:

Import-Module Microsoft.PowerShell.Security;

# Module Locations(Imp):

$moduleLocation = $env:PSModulePath -split ";";

Write-Output $moduleLocation;

