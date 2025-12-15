<#
Scripts

Every professional PowerShell developer spends more time debugging than writing code.
This chapter teaches you how to see what your script is doing, fix problems quickly, and write scripts that are easy to maintain months later.

16.1 Why Debugging Skills Matter

Scripts fail because of:

Wrong input

Unexpected data

Permission issues

Environment differences

Logic errors

A good admin:

expects failure

detects it early

explains it clearly

16.2 The Simplest Debug Tool: Write-Host vs Write-Output
❌ Avoid Write-Host for logic

It prints to screen only

Breaks pipelines
#>

Write-Host "Processing starts";#avoid this as it only prints to UI.

Write-Output "Processing Starts";

# Verbose o/p:

Write-Verbose "Connecting to Server";

# Debugging with PSBoundParameter:

$PSBoundParameters

function Get-ServiceInfo{
    param(
        [Parameter(Mandatory=$true)]
        [string]$ServiceName
    )

    $svc = Get-Service -Name $ServiceName -ErrorAction Stop;

    Write-Output $svc;
}

Get-ServiceInfo -ServiceName "AnyDesk";


#Setting Breakpoints:

# on a line 
Set-PSBreakpoint -Script .\Intro_1.ps1 -Line 55;

# on a variable:
$count = 10;
Set-PSBreakpoint -Variable $count;


# remove break points:

Get-PSBreakpoint | Remove-PSBreakpoint;

<#
16.6 Debugging in the ISE / VS Code (Conceptual)

If you use:

PowerShell ISE

VS Code + PowerShell extension

You get:

Step Into / Step Over

Variable watch

Call stack view

(We’ll stay console-focused, but know this exists.)


#>

<#
16.8 Defensive Scripting (Very Important)

Always assume:

User input is wrong

Files may not exist

Services may not be running

Example:
#>

$input = Read-Host "Enter something: ";
if(!($input)){
    throw "Input cant be empty";
}

$input;

<#
16.9 Logging for Troubleshooting

Always log:

Start

End

Errors
#>

$log = "A:\powershell\Powershell-Self\16_Debugging\script_2.log";

"[$(Get-Date)] Scripted started" | Out-File -FilePath $log -Append;

# Write maintainable scripts:

# 1. use comment wehen necessary:

$drive = Get-PSDrive -Name A;

# converting bytes to GB:
Write-Output "Free Space: $($drive.Free/1GB)";