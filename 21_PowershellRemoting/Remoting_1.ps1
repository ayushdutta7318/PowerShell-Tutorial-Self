<#
Chapter 21 – PowerShell Remoting (Run Commands on Remote Machines)

PowerShell Remoting turns your scripts from local tools into enterprise automation, allowing you to:

Run commands on remote servers

Manage multiple machines at once

Execute scripts across a network

Collect data from all systems centrally
#>

# to connect remotely to server and run a script:
Invoke-Command -ComputerName Server1-RootDC -ScriptBlock {Get-Service};

# S1 Enable remoting on server:


# write below code on target server.

Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

Start-Service sshd
Set-Service -Name sshd -StartupType Automatic

New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22

# run multiple commands

Invoke-Command -ComputerName Server01 -ScriptBlock {
    Get-Date
    Get-Service Spooler
}

# Run Command on Multiple Servers

Invoke-Command -ComputerName Server01,Server02,Server03 -ScriptBlock {
    Get-Service | Where-Object Status -eq "Running"
}

# using credentials

$cred = Get-Credential

Invoke-Command -ComputerName Server01 -Credential $cred -ScriptBlock {
    Get-Process
}

# 🧩 PART E – REMOTING SESSIONS

$session = New-PSSession Server01
Invoke-Command -Session $session -ScriptBlock { Get-Service }

# Close session:
Remove-PSSession $session

