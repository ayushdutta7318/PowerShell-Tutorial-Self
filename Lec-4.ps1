# FUNCTIONS:

function Test-ServiceHealth {
    param(
        [string]$ServiceName
    )

    try {
        $Service = Get-Service -Name $ServiceName -ErrorAction Stop;

        if ($Service.Status -eq "Running") {
            Write-Host "Service: ${Service} is Healthy" -ForegroundColor Green;
            return $true;
        }
        else {
            Write-Host "Service Status: $($Service.Status)" -ForegroundColor Red;
            $false;
        }

    }
    catch {
        <#Do this if a terminating exception happens#>
        Write-Host "${ServiceName} NOT FOUND" -ForegroundColor Yellow;
        return $false;
    }
    finally {
        Write-Host "Operation completed";
    }
    
}

Test-ServiceHealth -ServiceName "BITS";
Test-ServiceHealth -ServiceName "AnyDesk";
Test-ServiceHealth -ServiceName "ThisDoesNotExist";

# Functions accepting Pipeline Parameter:

function Restart-ServiceHealth {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string]$ServiceName
    )
    process {

        if (!(Test-ServiceHealth -ServiceName $ServiceName)) {

            try {
                Restart-Service -Name $ServiceName -Force -ErrorAction Stop;
                Start-Sleep -Seconds 1;

                if (Test-ServiceHealth -ServiceName $ServiceName) {
                    Write-Host "$ServiceName restarted successfully" -ForegroundColor Green;
                }

            }
        
            catch {
                <#Do this if a terminating exception happens#>
                Write-Host "Failed to restart $ServiceName" -ForegroundColor Red;
            }

        }
        
    }
}

"BITS", "ayush" | Restart-ServiceHealth;