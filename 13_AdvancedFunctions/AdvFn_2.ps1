# -WhatIf and -Confirm

<#
Used for safe operations.
#>

function Remove-SafeFile {
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path
    )

    if ($PSCmdlet.ShouldProcess($Path, "Remove File")) {#2nd parameter tells what we are doing
        Remove-Item $Path;
    }
}

# Remove-SafeFile -Path "A:\powershell\Powershell-Self\13_AdvancedFunctions\Sample_0.txt" -Confirm;

Remove-SafeFile -Path "A:\powershell\Powershell-Self\13_AdvancedFunctions\Sample_1.txt" -WhatIf;#deletes nothing, just powershell tells us what it is doing