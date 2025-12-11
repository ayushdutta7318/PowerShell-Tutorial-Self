# Error Handling in Powershell:

# 9.1 Understanding Errors in PowerShell

# Two main types:

# ✔️ Terminating Errors

# Script stops
# (e.g., Get-Item on a non-existing path if forced to terminate)

# ✔️ Non-Terminating Errors

# Script shows an error but continues
# (e.g., Get-ChildItem scanning a folder you don’t have permission for)

# We can control both using error handling.

# 9.2 The -ErrorAction Parameter

# Use -ErrorAction with almost any cmdlet.

# Options:

# Value	            Meaning
# SilentlyContinue	Hide the error
# Continue	        Show error but continue
# Stop	            Turn error into a terminating error (for catch block)
# Inquire	        Ask the user
# Ignore	        Ignore completely


# Syntax:

# try {
    # code that may fail
# }
# catch {
#     # what to do if error happens
# }

# eg 1:

try {
    Get-Content "A:\powershell\Powershell-Self\doesnotexist.txt" -ErrorAction Stop;

}
catch {
    Write-Host "Error Message: $($_.Exception.Message)" -ForegroundColor Red;
}
finally{
    "Cleaning up...";
}

# logging file and error:

$log = "A:\powershell\Powershell-Self\file_9.log";

"Script started on $(Get-Date)" | Out-File $log -Append;

"Processing files..." | Out-File $log -Append;

# log error:

try {
    Get-Content "A:\powershell\Powershell-Self\missing.txt" -ErrorAction Stop;
}
catch {
    "Error Message: $($_.Exception.Message)" | Out-File $log -Append;
}

# safe service restart:

function Restart-SafeService{
    param(
        [string]$ServiceName
    )

    try {
        $service = Get-Service -Name $ServiceName -ErrorAction Stop;
        Restart-Service -Name $service;
        Write-Host "Service restarted successfully" -ForegroundColor Green;
    }
    catch {
        Write-Host "Failed to restart service: $($_.Exception.message)" -ForegroundColor Red;
    }finally{
        Write-Host "Code ends here";
    }
}

Restart-SafeService -ServiceName "AarSvc_6a5d0c6";
Restart-SafeService -ServiceName "ayush";