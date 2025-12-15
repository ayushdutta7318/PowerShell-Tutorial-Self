# Creating your own module: step by step:

# S1 create module directory:

if(!(Test-Path "A:\powershell\Powershell-Self\15_PowershellModules\AdminTools")){
    New-Item -Path "A:\powershell\Powershell-Self\15_PowershellModules\AdminTools" -ItemType Directory;
}

# S2 create module file: extension: .psm1

if(!(Test-Path "A:\powershell\Powershell-Self\15_PowershellModules\AdminTools.psm1")){
    New-Item -Path "A:\powershell\Powershell-Self\15_PowershellModules\AdminTools.psm1";
}

# S3 add function to modules: this is contd. in AdminTools.psm1

# S4 Import test module:

Import-Module "A:\powershell\Powershell-Self\15_PowershellModules\AdminTools\AdminTools.psm1";

Get-DiskFreeSpace -DriveName "A";
Get-DiskFreeSpace -DriveName "C";
Get-DiskFreeSpace -DriveName "D";

<#
15.6 Exporting Only Selected Functions

Add this line at bottom of .psm1:
#>

Get-RunningServices;


# Module Manifest- Explain module metadata: (Later)

New-ModuleManifest -Path "A:\powershell\Powershell-Self\15_PowershellModules\AdminTools\AdminTools.psd1" -RootModule ".\AdminTools.psm1";

