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

# FUNCTIONS WITH MULTI PARAMETERS:

function Set-ServiceState{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$ServiceName,

        [Parameter(Mandatory=$true)]
        [ValidateSet("Start","Stop","Restart")]
        [string]$Action
    )

    try{
        $Service = Get-Service -Name $ServiceName -ErrorAction Stop;

        switch ($Action) {
            "Start"{
                if ($Service.Status -eq "Running"){
                    Write-Host "$Service is already Running" -ForegroundColor Yellow;
                }else{
                    Start-Service -InputObject $Service;
                    Write-Host "Started Service $ServiceName" -ForegroundColor Green; 
                }
            }

           "Stop"{
            if($Service.Status -eq "Stopped"){
                Write-Host "Service $ServiceName is already stopped" -ForegroundColor Yellow;
            }else{
                Stop-Service -InputObject $Service;
                Write-Host "Service $ServiceName has been stopped" -ForegroundColor Green;
            }
           }

           "Restart"{
            if($Service.Status -eq "Running"){
                Write-Host "Service is already running, need not to restart" -ForegroundColor Yellow;
            } 

            Restart-Service -InputObject $Service -Force;
            Write-Host "Service $ServiceName restarted" -ForegroundColor Green;
           }
        }

        $Service.Refresh();
        return $Service.Status;
    }catch{
        Write-Host "$Action cannot be performed on $ServiceName : $($_.Exception.Message)" -ForegroundColor Red;

        return $null;
    }
}

Set-ServiceState -ServiceName "AnyDesk" -Action Stop;
Set-ServiceState -ServiceName "ALG" -Action Start;



