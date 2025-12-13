# Assignment: Real world function:

function Get-FileSize {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [string]$PathToFile
    )

    begin {
        
        Write-Host "File check begins here";
    }

    
    process {
        if (!(Test-Path $PathToFile)) {
            Write-Host "$($PathToFile) does not exist";
            return;
        }
        
        $file = Get-Item -Path $PathToFile;
        Write-Host "File Name: $($file.Name), File Size in KB: $($file.Length/1KB)"

        [PSCustomObject]@{
            Name = $file.Name
            SizeKB = $file.Length/1KB
            Path = $file.FullName
        }
    }
    end {
        Write-Host "File Check completed";
    }
   
}

"Ayush", "A:\powershell\Powershell-Self\13_AdvancedFunctions\AdvFn_1.ps1", "A:\powershell\Powershell-Self\13_AdvancedFunctions\assignment_2.ps1" | Get-FileSize;




