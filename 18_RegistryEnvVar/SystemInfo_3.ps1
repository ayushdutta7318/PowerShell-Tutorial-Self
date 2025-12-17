# System Info:

# OS info:
Get-ComputerInfo;

# cpu info:

Get-CimInstance Win32_Processor;

# drive info:

Get-CimInstance Win32_LogicalDisk;

# bios info:

Get-CimInstance Win32_BIOS;

# old times, we used wmi instead of cim: always prefer cim:

Get-WmiObject;

Get-CimInstance Win32_Processor;

# real world eg:

$sys = Get-ComputerInfo;

$customObj = [PSCustomObject]@{
    ComputerName = $env:COMPUTERNAME;
    OS = $sys.OSName;
    Version = $sys.OSVersion;
    LastBoot = $sys.OSLastBootUpTime
}

$customObj;

