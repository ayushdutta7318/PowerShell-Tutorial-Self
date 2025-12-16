# Service Management:

# get all services:

$allServices = Get-Service;

$allServices;

# fileter running ans stopped service:
Write-Output "--------------------------------------------------------";

Get-Service | Where-Object {$_.Status -eq "Running"};

Write-Output "-------------------------------------------------";

Get-Service | Where-Object {$_.Status -eq "Stopped"};

# Service management:

# Start a service:

$svc = Read-Host "Enter service name: ";

$servicename = Get-Service -Name $svc;

if(!($servicename)){
    Write-Output "Service doesnt exist";
}else{
    Start-Service $servicename;
}

# stop service:

Stop-Service -Name "ayush";

# restart service:

try {
    Restart-Service -Name AnyDesk -ErrorAction SilentlyContinue;
}
catch {
    Write-Output "Error found";
}

# safe service handling:

Write-Output "-------------------------------------";
$serv = Get-Service -Name "WwanSvc";

if($serv -and $serv.Status -ne "Running"){
    Start-Service $serv;
}

# Set Service:

<#
Startup types:

Automatic

Manual

Disabled
#>


Set-Service -Name "ayush" -StartupType Automatic;
