# Functions in Powershell:

'''
What: A PowerShell function is a named block of code you can call to perform a task, reuse logic, and accept inputs.

Why: Functions make scripts modular, easier to read, test, and reuse.

Where: You can define functions in a .ps1 script, a module .psm1, or interactively in the console.

'''

function Say-Hello {
param($Name="World")

Write-Host "Hello, $Name";
}

Say-Hello -Name "Ayush";
Say-Hello -Name "Alice";
Say-Hello;


# funtions with datatype: 

"""
Functions with Parameter datatypes: We have already seen functions with parameters. We can also specify datatypes for parameters to enforce input types.

datatypes in Powershell include: 
- [string]
- [int]
- [bool]
- [array]
- [datetime]
"""

function Add-Numbers {
    param(
        [int]$a, [int]$b
    )
    return Write-Host "The sum is: $($a + $b)" ;
}

Add-Numbers -a 5 -b 54;

# Functions with array:

function Print-Friends {
    param(
        [array]$FriendList
    )
    return Write-Host "My Firends are: $FriendList";
}

Print-Friends -FriendList @("Ayush", "Sid", "Harry");

# Mandatory Parameters in Functions:

"""
Mandatory Parameters in Functions: You can make parameters mandatory so that the function cannot be called without providing those arguments. This is done using the [Parameter(Mandatory=$true)] attribute.

Syntax:
function Function-Name {
    param(
        [Parameter(Mandatory=$true)]
        [datatype]$ParameterName
    )
    # Function body
}
"""

function Greet-Person {
    param(
        [Parameter(Mandatory=$true, HelpMessage="Please provide a name to greet")]
        [string]$firstName,

        [Parameter(Mandatory=$true, HelpMessage="Please provide a last name to greet")]
        [string]$lastName
    )

    Write-Host "Good morning, $firstName $lastName!";
}

Greet-Person -firstName "Ayush" -lastName "Dutta";




"""
# Examples: 
What is [Alias()] attribute in Powershell functions?
The [Alias()] attribute in PowerShell functions allows you to define alternative names for parameters. This means that when calling the function, you can use either the original parameter name or any of its aliases. This is particularly useful for improving readability or providing shorthand options for commonly used parameters.

"""

function Get-Username{
    param(
        [Alias("u")]
        [string]$Username
    )
    Write-Host "The username is: $Username";
}

Get-Username -Username "Ad";
Get-Username -u "Ad";


# Getting Values from Pipeline in Functions:

"""
Functions can accept input from the pipeline using the ValueFromPipeline attribute in the parameter definition. This allows you to pass objects directly to the function through the pipeline.
"""

function Say-MultiHello {
    param(
        [Parameter(ValueFromPipeline=$true)]
        [string]$Name
    )

    begin{
        Write-Host "Starting to greet names..." -ForegroundColor Cyan;  
    }
    process{
        Write-Host "Hello, $Name" -ForegroundColor Green;   
    }
    end{
        Write-Host "Finished greeting names." -ForegroundColor Cyan;  
    }
}

"Ayush", "Rohit", "Rohan" | Say-MultiHello;

# [cmdletbinding()] in Powershell Functions:

"""
The [CmdletBinding()] attribute in PowerShell functions transforms a function into an advanced function, enabling it to behave like a cmdlet. This provides additional features such as support for common parameters (e.g., -Verbose, -Debug), parameter validation, and better error handling.

SupportShouldProcess: This parameter allows the function to support the -WhatIf and -Confirm parameters, enabling users to simulate actions or confirm them before execution.
"""

function Remove-Thing{
    [cmdletbinding(SupportsShouldProcess=$true)]

    param(
        [Parameter(Mandatory=$true)]
        [Alias("t")]
        [string]$ThingName
    )

    if($PSCmdlet.ShouldProcess($ThingName, "Remove")){
        Write-Host "Removing $ThingName..." -ForegroundColor Red;
    }
return $true;
}

Remove-Thing -t "abcde";

# Prompt for Functions chat: Explain functions in powershel from the very basics. use examples of code to illustrate your points.