# Conditionals in powershell:

# basic syntax:

$age = 8;

if ($age -gt 5 -and $age -lt 10) {
    Write-Host "Go with your parents";
}
elseif ($age -ge 10 -and $age -le 18) {
    Write-Host "Go with your siblings";
}
else {
    Write-Host "You can go out alone";
}

# check if a specific service is running:

$service = Get-Service -Name "AnyDesk";

Write-Host "-------------------------------------------"

if ($service.Status -eq "Running") {
    Write-Host "$($service) is Running";
}
else {
    Write-Host "$($service) is Stopped!";
}

Write-Host "--------------------------------"

$file = Test-Path "A:\powershell\Powershell-Self\test.txt";

if ($file) {
    Write-Host "file exists"
}
else {
    Write-Host "file does not exist";
}

Write-Host "------------------------------------------";

$drive_space = Get-PSDrive A;


if ($drive_space.Free -le 10GB) {
    Write-Host "Low disk space";
}
else {
    Write-Host "Space available: $($drive_space.Free/(1024*1024*1024)) GB";
}

Write-Host "-----------------------------------------------";

if ($env:USERNAME -eq "Administrator") {
    Write-Host "you are admin user";
}
else {
    Write-Host "you are normal user";
}

Write-Host "--------------------------------------------------";

$service_name = Read-Host "Enter Service Name: ";

# try-catch LATER

try {
    $svc = Get-Service -Name $service_name -ErrorAction Stop;
    if ($svc.Status -eq "Stopped") {
        Start-Service $svc;
        Write-Host "$svc has been started";
    }
    else {
        Write-Host "Service is Running";
    }
}
catch {
    Write-Host "$($svc) does not exist" -ForegroundColor Red;
}




