# file/directory handling:

# to create dirctory:

# first check if the folder already exist:

if (!(Test-Path "A:\powershell\Powershell-Self\10_FileHandling\testfolder")) {
    New-Item -Path "A:\powershell\Powershell-Self\10_FileHandling\testfolder" -ItemType Directory;
}

# aliter of above:

if (!(Test-Path "A:\powershell\Powershell-Self\10_FileHandling\testfolder2")) {
    mkdir -Path "A:\powershell\Powershell-Self\10_FileHandling\testfolder2";
}

# create file:

# first check if file doesnt exist:

if (!(Test-Path "A:\powershell\Powershell-Self\10_FileHandling\test.txt")) {
    New-Item -Path "A:\powershell\Powershell-Self\10_FileHandling\test.txt" -ItemType File;
}


# create empty file:

if (!(Test-Path "A:\powershell\Powershell-Self\10_FileHandling\blank.txt")) {
    "" | Out-File -FilePath "A:\powershell\Powershell-Self\10_FileHandling\blank.txt";
}

# writing to files:

"Hello, World!" | Out-File "A:\powershell\Powershell-Self\10_FileHandling\blank.txt";
"Ayush Dutta created this file" | Out-File "A:\powershell\Powershell-Self\10_FileHandling\blank.txt" -Append;

# writing multiple lines in a file:

@"
This is line 1.
This is line 2.
this is line 3.
"@ | Out-File -FilePath "A:\powershell\Powershell-Self\10_FileHandling\blank.txt" -Append;

if (!(Test-Path "A:\powershell\Powershell-Self\10_FileHandling\logging.log")) {
    New-Item -Path "A:\powershell\Powershell-Self\10_FileHandling\logging.log" -ItemType File;
}

"New entry at $(Get-Date)" | Out-File -FilePath "A:\powershell\Powershell-Self\10_FileHandling\logging.log" -Append;

"Ayush Dutta Creted this file" | Out-File -FilePath "A:\powershell\Powershell-Self\10_FileHandling\logging.log" -Append;

# Reading from the file:

Get-Content -Path "A:\powershell\Powershell-Self\10_FileHandling\logging.log";

# reading with line number:

Write-Host "------------------------------------------";

Get-Content -Path "A:\powershell\Powershell-Self\10_FileHandling\blank.txt" | Select-Object -Index 0, 1, 2, 3, 4;

# reading from last:

Write-Host "------------------------";
Get-Content -Path "A:\powershell\Powershell-Self\10_FileHandling\logging.log" | Select-Object -Last 5;

if (!(Test-Path "A:\powershell\Powershell-Self\10_FileHandling\backup\blank.txt") -and !(Test-Path "A:\powershell\Powershell-Self\10_FileHandling\backup\logging.log") -and !(Test-Path "A:\powershell\Powershell-Self\10_FileHandling\backup\testfolder") -and !(Test-Path "A:\powershell\Powershell-Self\10_FileHandling\backup\testfolder2")) {

    Copy-Item -Path "A:\powershell\Powershell-Self\10_FileHandling\blank.txt" -Destination "A:\powershell\Powershell-Self\10_FileHandling\backup";
    
    Copy-Item -Path "A:\powershell\Powershell-Self\10_FileHandling\testfolder" -Destination "A:\powershell\Powershell-Self\10_FileHandling\backup";

    Copy-Item -Path "A:\powershell\Powershell-Self\10_FileHandling\testfolder2" -Destination "A:\powershell\Powershell-Self\10_FileHandling\backup";

    Copy-Item -Path "A:\powershell\Powershell-Self\10_FileHandling\logging.log" -Destination "A:\powershell\Powershell-Self\10_FileHandling\backup";

}

# we can do same with move item.

# Deleteing Directories and Files:

if(Test-Path "A:\powershell\Powershell-Self\10_FileHandling\backup\blank.txt"){
    Remove-Item -Path "A:\powershell\Powershell-Self\10_FileHandling\backup\blank.txt" -Recurse -Confirm;
}

if(Test-Path "A:\powershell\Powershell-Self\10_FileHandling\backup\logging.log"){
    Remove-Item -Path "A:\powershell\Powershell-Self\10_FileHandling\backup\logging.log" -Recurse -Force;
}

if(Test-Path "A:\powershell\Powershell-Self\10_FileHandling\backup\testfolder"){
    Remove-Item -Path "A:\powershell\Powershell-Self\10_FileHandling\backup\testfolder" -Recurse -Confirm;
}

if(Test-Path "A:\powershell\Powershell-Self\10_FileHandling\backup\testfolder2"){
    Remove-Item -Path "A:\powershell\Powershell-Self\10_FileHandling\backup\testfolder2" -Recurse -Confirm;
}

# File Searching:

Get-ChildItem -Path "A:\powershell\Powershell-Self\10_FileHandling" -Filter *.log -Recurse -ErrorAction SilentlyContinue;

"----------------------------------------";
Get-ChildItem -Path "A:\powershell\Powershell-Self\10_FileHandling" | Where-Object {$_.Length -gt 1KB};


# Searching text in a file:
if(!(Test-Path "A:\powershell\Powershell-Self\10_FileHandling\test.txt")){
    New-Item -Path "A:\powershell\Powershell-Self\10_FileHandling\test.txt" -ItemType File;
}


@"
Hello World.
I am Ayush.
This is line 1.
This is line 2.
This is line 3.
"@ | Out-File -FilePath "A:\powershell\Powershell-Self\10_FileHandling\test.txt" -Append;

Select-String -Path "A:\powershell\Powershell-Self\10_FileHandling\test.txt" -Pattern "Ayush";

"----------------------------------"
Select-String -Path "A:\powershell\Powershell-Self\10_FileHandling\test.txt" -Pattern "Ayush" -CaseSensitive;

# Dynamic path: environment variable: In PowerShell, $env: is the environment variable drive. It lets you view, read, and modify environment variables.

$env:Path;

# creating our custom $env:
$env:MyVar = "A:\powershell\Powershell-Self\10_FileHandling\testfolder";
$env:MyVar.Length;

# Q1 Backup folder:

if(!(Test-Path "A:\powershell\Powershell-Self\10_FileHandling\backup")){
    New-Item -Path "A:\powershell\Powershell-Self\10_FileHandling\backup" -ItemType Directory;
}

function Backup-Folder{
    param(
        [string]$Source,
        [string]$Destination
    )

    if(!(Test-Path $Source)){
        Write-Host "Source Folder not found" -ForegroundColor Red;
        return;
    }

    if(!(Test-Path $Destination)){
        New-Item -Path $Destination -ItemType Directory;
    }

    Copy-Item -Path $Source -Destination $Destination;
    return $true;
}

Backup-Folder -Source "A:\powershell\Powershell-Self\10_FileHandling\testfolder" -Destination "A:\powershell\Powershell-Self\10_FileHandling\backup";
Backup-Folder -Source "A:\powershell\Powershell-Self\10_FileHandling\testfolder2" -Destination "A:\powershell\Powershell-Self\10_FileHandling\backup";