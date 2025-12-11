# validate input from user:

function Validate-Input{
    param(
        [int]$num
    )

    try {
        $log = "A:\powershell\Powershell-Self\9_Error_Handling\validate.log";
        Write-Host "You Enter the number: $($num)" -ErrorAction Stop;
        "You Enter the number: $($num)" | Out-File $log -Append;
    }
    catch {
        Write-Host "Error message: $($_.Exception.message)" -ForegroundColor Red;
        "Error message: $($_.Exception.message)" | Out-File $log -Append;
    }
    finally{
        Write-Host "Code ends";
    }
}

# Validate-Input -num 55;
# Validate-Input -num 36;
# Validate-Input -num "ayush";

# Q1

Write-Host "-------------------------------------------------";

try {
    $path = Get-ChildItem -Path "A:\powershell\Powershell-Self\none.txt" -ErrorAction Stop;
    Write-Host "path: $($path)";
}
catch {
    Write-Host "$($_.Exception.message)" -ForegroundColor Red;
}
finally{
    "code ends here";
}

$log = "A:\powershell\Powershell-Self\9_Error_Handling\username_4.log";

$username = Read-Host "Enter your username: ";

$username | Out-File $log -Append;

# Q3.

function Test-ProcessSafe{
    param(
        [string]$ProcessName
    )
    try {
        $process = Get-Process -Name $ProcessName -ErrorAction Stop;
        Write-Host "Process $($process) is running safely";
        
    }
    catch {
        Write-Host "$($ProcessName) does not exist" -ForegroundColor Red;
    }
    finally{
        Write-Host "Code Ends Here........";
    }
}

Test-ProcessSafe -ProcessName "AnyDesk";
Test-ProcessSafe -ProcessName "ayush";