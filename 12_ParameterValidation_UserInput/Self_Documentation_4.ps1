# Self Documentation: It provides how and what a fn does.

function Action-Service {

<#

.SYNOPSIS
Controls Windows services

.DESCRIPTION
Starts, stops and restarts services as per the input

.PARAMETER ServiceName
Takes the name of the service

.PARAMETER Action
Tells fn what to do.

.EXAMPLE
.\Self_Documentation_4.ps1 -ServiceName "serivce" -Action "Start" 


#>

    param(
        [Parameter(Mandatory = $true)]
        [string]$ServiceName,

        [Parameter(Mandatory = $true)]
        [ValidateSet("Start", "Stop", "Restart")]
        [string]$Action
    )

    try {
        $svc = Get-Service -Name $ServiceName -ErrorAction Stop;
        
        switch ($Action) {
            "Start" { Start-Service $svc };
            "Stop" { Stop-Service $svc };
            "Restart" { Restart-Service $svc }
            
        }
        Write-Output "$($ServiceName) $($Action) successfully: $($svc)";
    }
    catch {
        Write-Host "$($_.Exception.Message)" -ForegroundColor Red;
    }
    finally {
        Write-Host "Script Completed" -ForegroundColor Green;
    }
    return $true;
}

Action-Service -ServiceName "AnyDesk" -Action "Start";
Action-Service -ServiceName "Ayush" -Action "Start";
Action-Service -ServiceName "Suresh" -Action "Start";