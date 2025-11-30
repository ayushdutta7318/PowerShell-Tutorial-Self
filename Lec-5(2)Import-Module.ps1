# Import module:

Import-Module .\Lec-5.psm1;

Set-ServiceState -ServiceName "ayush" -Action Start;

Set-ServiceState -ServiceName "AnyDesk" -Action Start;

# Advanced Function Parameters:

function Test-ServiceHealth {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [string[]]$ServiceName,
        [switch]$IncludeStopped
    )
    begin {
        Write-Verbose "Starting Service health check..."
        $results = @();
    }

    process {
        foreach ($Service in $ServiceName) {
            try {
                $ServiceObj = Get-Service -Name $Service -ErrorAction Stop;
                $IsHealthy = $ServiceObj.Status -eq "Running";

                $result = [PSCustomObject]@{
                    ServiceName = $Service
                    Status      = $ServiceObj.Status
                    IsHealthy   = $IsHealthy
                    DisplayName = $ServiceObj.DisplayName
                }

                if ($IncludeStopped -or $IsHealthy) {
                    $results += $result;
                }
            }
            catch {
                $result = [PSCustomObject]@{
                    ServiceName = $Service
                    Status      = $ServiceObj.Status
                    IsHealthy   = $false
                    DisplayName = "N/A"
                }
                $results += $result;
            }
        }

    }
   
    end{
        return $results;
    }
}

Test-ServiceHealth -ServiceName "AnyDesk" , "BITS", "ayush" -IncludeStopped -Verbose;
Test-ServiceHealth -ServiceName "AnyDesk" , "BITS", "ayush" 