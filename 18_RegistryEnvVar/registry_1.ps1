# Windows Registr:

<#
18.1 What Is the Windows Registry? (Beginner View)

The registry is a central configuration database for Windows and applications.

Think of it like:

Registry
└── Keys (folders)
    └── Values (settings)



⚠️ Danger note:
Incorrect registry changes can break systems.
PowerShell helps you be precise and safe.

Registry Hives:

| Hive | Purpose               |
| ---- | --------------------- |
| HKLM | System-wide settings  |
| HKCU | Current user settings |
| HKCR | File associations     |
| HKU  | All user profiles     |
| HKCC | Hardware profile      |

#>

# go toa registry path:

# cd HKCU:\Software

Get-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name .\Microsoft -ErrorAction SilentlyContinue;


# creating registry key and values:

if(!(Test-Path "HKCU:\Software\TestKey")){
    New-Item -Path "HKCU:\Software\TestKey";
}

if(!(Get-ItemProperty -Path "HKCU:\Software\TestKey" -Name TestValue)){
    New-ItemProperty -Path "HKCU:\Software\TestKey" -Name TestValue -Value "Hello" -PropertyType String;
}

Get-ItemProperty -Path "HKCU:\Software\TestKey" -Name TestValue;

# Modifying registry values:

Set-ItemProperty -Path HKCU:\Software\TestKey -Name TestValue -Value "Updated";

Write-Output "-----------------------";

Get-ItemProperty -Path HKCU:\Software\TestKey;

# delete registyry key value:

Remove-Item -Path HKCU:\Software\TestKey -Recurse -Confirm;
