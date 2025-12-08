# Loops:

# Why Loops Matter

# Imagine you need to:

# Check 100 servers

# Create 50 user accounts

# Process 500 files

# Doing each step manually is impossible.
# With loops, PowerShell does it for you.

$numbers = 1,2,3,4,5,6;

foreach($number in $numbers){
    Write-Output $number;
}

$names = "ayush", "ramesh", "suresh";

foreach ($name in $names){
    Write-Output "hello, my name is $($name)";
}

# display files using loops:

$files = Get-ChildItem | Select-Object Name, Length;

foreach($file in $files){
    Write-Output $file;
}

# LOOP 2: 6.4 Loop #2 – for Loop: Used when you know exactly how many times to loop.

for($i = 0; $i -lt 6; $i++){
    Write-Output "The value is $($i)";
}

# Countdown: backward loop:

for($i=5;$i -gt 0; $i--){
    Write-Output "tick-tick: $($i)";
}


# 6.5 Loop #3 – while: Runs as long as the condition is true.

$a = 0;
while ($a -lt 6) {
Write-Output "Value of a is $($a)";
$a++;    
}

# loop until a file exist:

while (-not (Test-Path "A:\powershell\Powershell-Self\test.txt") ) {
"waitin for the file";
Start-Sleep -Seconds 1; #prints o/p every 1 sec.
}

# Looping through objects:

$serv = Get-Service | Select-Object -First 10;

foreach($service in $serv){
   if($service.Status -eq "Running"){
    Write-Output "The service is $($service.Name)";
   }
}

# Example: Find large files

$files = Get-ChildItem | Where-Object {$_.Length -gt 1KB};

foreach($file in $files){
    Write-Output $files;
}

# break and continue:

foreach($i in (1..6)){
    if($i -eq 2){break};
    $i;
}

foreach($i in (1..6)){
    if($i -eq 2){
        continue;
    }

    $i;
}

# Q1; print 1 -10

for($i=1;$i -le 10; $i++){
    Write-Output $i;
}


# Q2 Lab 2 — Print all file names in Downloads

$filename = Get-ChildItem -File -Path "C:\Users\Lone_Wolf\Downloads";

foreach($file in $filename){
    Write-Output $file;
}

# Q3

$a = 1;
while ($a -le 10) {
Write-Output $a;
$a++;    
}