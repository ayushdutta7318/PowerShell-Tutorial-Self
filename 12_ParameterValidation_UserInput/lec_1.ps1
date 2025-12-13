# Parameters: Parameters can be passed both to the script as well as functions. This block should always be at the top of script if passing to the script only.

param(
    [string]$Name,
    [int]$Age,

    # if a parameter is manadatory: if not entered, ps will prompt.
    [Parameter(Mandatory=$true)]
    [int]$Id,

    # default values in parameter:
    [string]$Address = "house 1",

    # how to allow a specific set of values:
    [ValidateSet("Start", "Stop", "Restart")]
    $Action,

    # validate pattern:
    [ValidatePattern("\.txt$")]
    [string]$Filename
)

Write-Output "hello, my name is $($Name), and my age is $($Age). My Id is $($Id). My Address is $($Address), $($Action), $($Filename)";






