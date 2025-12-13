# Advance Fucntion: 13.1 What Is an Advanced Function?

# An advanced function is a function that behaves like a cmdlet.

function Greet-To {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$Name
    )

    process {
        Write-Host "Hello, $($Name)";
    }
}

Greet-To -Name "Ayush" -Verbose;

<#
What Does [CmdletBinding()] Do?

It turns your function into a mini-cmdlet.

Automatically adds:

-Verbose

-Debug

-ErrorAction

-WhatIf

-Confirm
#>

# function inputs and entering parameters as pipeline

function Say-Hello {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string]$Name
    )
    begin {
        Write-Host "Function starts here..."
    }process {
        Write-Host "Good Morning, $($Name)";
    }end {
        Write-Host "Function ends here..."
    }
}

"Ayush", "Abhi", "Ashutosh" | Say-Hello;

