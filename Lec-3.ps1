# ERROR HANDLING:

'''
Core Concept 1: The Two Types of "Errors"
Non-Terminating Errors: The default. Something goes wrong, PowerShell writes a warning (in red), but continues to the next item in the pipeline. Think of Get-Process -Name "ThisDoesNotExist". It errors, but your script keeps running.

Terminating Errors: A serious fault that halts the execution of the current command, function, or script entirely.

Our goal is to convert non-termininating errors into terminating ones so we can catch and handle them.

'''

# Get-Process | Get-Member;


# Get-Process -Name "thisDoesNotExist"; #produce red color error but continues
# Get-Process -Name "ThisDoesNotExist" -ErrorAction SilentlyContinue; #no o/p, no error
# Get-Process -Name "ThisDoesNotExist" -ErrorAction Continue; #produce red color error but continues
# Get-Process -Name "ThisDoesNotExist" -ErrorAction Stop; #stops the moment it hit errors

Write-Host "Script Continues";

# TRY CATCH BLOCK:

'''
lets have  a process

Try {
    # Put the code that might cause a TERMINATING error here.
    # If an error occurs here, PowerShell immediately jumps to the Catch block.
}
Catch {
    # This block runs ONLY if an error occurred in the Try block.
    # The error details are stored in the automatic variable `$_`
    Write-Host "An error occurred: $($_.Exception.Message)" -ForegroundColor Red
}
Finally {
    # This block runs ALWAYS, whether there was an error or not.
    # Use it for cleanup tasks, like closing files or connections.
}
'''
$ProcessName = Read-Host "Enter the process name to stop";


try {
    Write-Host "Attempting to find the Process: $ProcessName" -ForegroundColor Yellow;

    # We use -ErrorAction Stop to FORCE any error (like process not found) to be a terminating error.
    $Process = Get-Process -Name $ProcessName -ErrorAction Stop;
    
    Write-Host "This is the process error: $($Process)";

    Write-Host "Process Name: $($ProcessName.Name), Process ID: $($Process.Id) Stopping it ..." -ForegroundColor Cyan

    $Process | Stop-Process -Force -ErrorAction Stop;

    Write-Host "Process $ProcessName stopped successfully" -ForegroundColor Green;
}
catch {
    <#Do this if a terminating exception happens#>
    # This will run if EITHER Get-Process OR Stop-Process fails with a terminating error.
    Write-Host "FAILED: $($_.Exception.Message)" -ForegroundColor Red;
}
finally{
    Write-Host "Script operation complete" -ForegroundColor Gray;
}


'''
---------------------ASSIGNMENT--------------------------------------
'''

$serviceName = Read-Host "Enter the name of the service";

try{
$Service = Get-Service -Name $serviceName -ErrorAction Stop;
$Service

if ($Service.Status -eq "Stopped") {
    <# Action to perform if the condition is true #>
    $Service.Start();
}else {
    <# Action when all if and elseif conditions are false #>
    Write-Host "Service Name: $($Service.Name), Id: $($Service.Id) Is Healthy" -ForegroundColor Green;
}


}
catch{
# if the service is not found
Write-Host "SERVICE NOT FOUND: $($_.Exception.Message)" -ForegroundColor Red
}
finally{
    Write-Host "Script Completed";

}




