#Functions and script structuring:8.1 What Is a Function? A function is a reusable block of code that performs a specific task. 

# function name also follows ver-noun sysntax:

function Say-Hello {
    Write-Host "Hello, World!";
}

Say-Hello;

# fn with parameter:

function Greet-To {
    param($person = "World");

    Write-Host "Hello, $($person)";
};

Greet-To -person "Ayush";
Greet-To; #if we dont add parameters, it will print default values:

# function returning values:

function Add-Numbers {
    param(
        [int]$a = 5,
        [int]$b = 5
    )
    return $a + $b;
}

Add-Numbers -a 27 -b 45;
Add-Numbers;

# Real world appn:

function Test-ServiceStatus {
    param(
        [string]$Service
    )

    try {
        $svc = Get-Service -Name $Service -ErrorAction Stop;

        if ($svc.Status -eq "Running") {
            Write-Host "$($svc) is running" -ForegroundColor Green;
        }
        else {
            Write-Host  "$($svc) is Stopped" -ForegroundColor Yellow;
        }
    }
    catch {
        Write-Host "$($Service) does not exist" -ForegroundColor Red;
    }
    
    return 0;

}


Test-ServiceStatus -Service "AnyDesk";
Test-ServiceStatus -Service "Ayush";
Test-ServiceStatus -Service "wuauserv";


# get disk space:

function Get-DiskStatus {
    param(
        [string]$Drive
    )

    try {
        $info = Get-PSDrive -Name $Drive -ErrorAction Stop;

        Write-Host "$([math]::Round($info.Free/1GB, 2))";
    }
    catch {
        Write-Host "$($Drive) Does not exist";
    }
}



Get-DiskStatus -Drive "C";
Get-DiskStatus -Drive "A";

# check server connection:

function Test-ServerConnection {
    param(
        [array]$Servers
    )

    foreach ($server in $Servers) {
        if (Test-Connection $server -Quiet -Count 1) {
            #-Quiet means it wont show the ping, Test-connect means ping, -Count 1: means only one ICMP packet sent.
            Write-Host "$($server) is available;"
        }
        else {
            Write-Host "$($server) is unavailable";
        }
    }
}

Test-ServerConnection -Servers "google.com", "bing.com", "firefox.com", "ayushdutta.com";


# Fn returning obj:

function Get-ProcessInfo {
    param(
        $ProcessName
    )

    try {
        $process = Get-Process -Name $ProcessName -ErrorAction Stop | Select-Object Name, Id, CPU;

        Write-Host $process -ForegroundColor Green;
    }
    catch {
        Write-Host "$($ProcessName) does not exist" -ForegroundColor Red;
    }
}

Get-ProcessInfo -ProcessName "AnyDesk";
Get-ProcessInfo -ProcessName "ayush";
Get-ProcessInfo -ProcessName "chrome";

# check if a folder exist:

function Test-Folder{
    param(
        $path
    )

    if(Test-Path $path){
        Write-Host "$($path) exist";
    }else{
        Write-Error "Folder does not exist";
    }
}

Test-Folder -path "A:\powershell\Powershell-Self\ayush";

# CPU consuming process

function Get-CPUInfo{
    return Get-Process | Sort-Object CPU -Descending | Select-Object -First 3;
}

Get-CPUInfo;