# Lesson 5: Modules, Scope, and Real-World Script Architecture

'''
A module is just a package of related functions that you can share and reuse. Well turn your MyToolkit.ps1 into a proper module.
'''

$ModulePath = "$A\powershell\Powershell-Self";

New-Item -ItemType Directory -Path $ModulePath -Force;

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


New-ModuleManifest -Path "$ModulePath\MyAdminTools.psd1" `
    -RootModule "mytools.psm1" `
    -Author "Ayush Dutta" `
    -Description "Collection of system administration tools" `
    -FunctionsToExport "Set-ServiceState";