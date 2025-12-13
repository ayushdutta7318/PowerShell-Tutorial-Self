# Service control script:

function Action-Service {
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