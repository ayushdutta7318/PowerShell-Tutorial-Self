<#

18.8 What Are Environment Variables?

They store system and user-level configuration.

Examples:

PATH

USERNAME

TEMP

COMPUTERNAME
#>

# view env var:

Get-ChildItem Env:  #list all variables

# view one env var:

Write-Output "------------------------";


$env:USERNAME;

# setting env var:

# 1. current session only:

$env:MYVAR = "Test";

$env:MYVAR;

# 2. Persistent selvel - user level:

[Environment]::SetEnvironmentVariable(
    "MYVAR_1",
    "PersistenValue",
    "User"

)
# restart powershell to see persistent value;

$env:MYVAR_1;