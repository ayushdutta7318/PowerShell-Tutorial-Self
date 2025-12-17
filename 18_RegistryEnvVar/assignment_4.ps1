# Assignment:

# 1. 

Get-ItemProperty -Path 'HKCU:\Control Panel\Desktop';

if(!(Test-Path HKCU:\Software\TestKey)){
    New-Item -Path HKCU:\Software\TestKey;
}

if(!(Get-ItemProperty -Path HKCU:\Software\TestKey -Name TestValue)){
    New-ItemProperty -Path HKCU:\Software\TestKey -Name TestValue -Value "Sample" -PropertyType String;
}

Get-ItemProperty -Path HKCU:\Software\TestKey

if(Get-ItemProperty -Path "HKCU:\Software\TestKey"){
    Remove-Item -Path HKCU:\Software\TestKey -Recurse -Confirm;
}


# 2.

Write-Output "-----------------";

$env:TESTVARIABLE = "Test";

$env:TESTVARIABLE;

# 3.

Get-CimInstance Win32_OperatingSystem;