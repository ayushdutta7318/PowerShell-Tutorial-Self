# Execution plolicy:

# 11.2 Why Scripts Don’t Run by Default (Very Important)

# By default, Windows blocks script execution to protect you from malware.

# So when beginners try to run a script, they see errors like:
# File C:\Test\script.ps1 cannot be loaded because running scripts is disabled on this system.

# to check policies:

Get-ExecutionPolicy; #o/p bypass: not recommneded

# to set execution policy:

# Set-ExecutionPolicy RemoteSigned -Scope CurrentUser;


# 11.7 Creating Your First Script
# Step 1: Create a script file
# notepad C:\Scripts\hello.ps1

# if you want to run a script: write full path: A:\powershell\Powershell_Self\11_ExecutionPolicy\test.ps1

#  .\ means running from current directory.

# powershell doesnt trust current directory, so we should run script as .\script_name.ps1 or full path. This prevents malicious scripts from being executed.



