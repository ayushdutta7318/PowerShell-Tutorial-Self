<#
📘 Chapter 22 – Active Directory with PowerShell (Users, Groups, OUs, Passwords)

Note: AD cmdlets require the ActiveDirectory module, normally installed on:

Domain Controllers

RSAT tools on Windows

Windows Server with AD DS module

To import it:
#>

# Import-Module -Name ActiveDirectory;

Get-Command -Module ActiveDirectory;

<#
🧩 PART A – ACTIVE DIRECTORY BASICS

Active Directory organizes objects:

Domain
├── Organizational Units
│   ├── Users
│   ├── Computers
│   └── Groups


Objects have properties like:

SamAccountName

DisplayName

DistinguishedName

UPN

PowerShell gives full control.
#>

# USER Management:


# create new user:
$Ad = Get-ADDomain

$Ad.DistinguishedName;

Get-ADOrganizationalUnit -Filter *;

New-ADUser -Name "Ramesh Saxena" -SamAccountName "rsaxena" -UserPrincipalName "rsaxena@techmech.com" -Path "OU=Electronics Engineering, DC=techmech, DC=com" -AccountPassword (Read-Host -AsSecureString "enter passwd") -Enabled $true


# enable disbale user

Disable-ADAccount rsaxena
Enable-ADAccount rsaxena

# Reset Password

Set-ADAccountPassword jdoe -Reset -NewPassword (Read-Host -AsSecureString)


# Unlock Account

Unlock-ADAccount jdoe

# GROUP MANAGEMENT:

# create new grp:
New-ADGroup -Name "Cyber Security" -GroupScope Global -GroupCategory Security -Path "OU=Electronics Engineering,DC=techmech,DC=com";

# Add User to Group

Add-ADGroupMember -Identity "Electronics Engineering" -Members adutta;

# Remove User from Group

Remove-ADGroupMember -Identity "Electronics Engineering" -Members rsaxena -Confirm;

# list member of grp:

Get-ADGroupMember -Identity "Cyber Security";

# Organizational Units:

# create new OU:

New-ADOrganizationalUnit -Name "IT" -Path "DC=domain_name,DC=com"

# move user to anew OU:

Move-ADObject `
-Identity "CN=John Doe,OU=HR,DC=domain,DC=local" `
-TargetPath "OU=IT,DC=domain,DC=local"

# PART E – COMPUTER ACCOUNTS

Get-ADComputer -Filter *
Get-ADComputer -Filter "OperatingSystem -like '*Windows Server*'"

# PART F – SEARCH & FILTER

# Search diabled Account

Search-ADAccount -AccountDisabled

# search locked acct:
Search-ADAccount -LockedOut

# find expiring paasswd
Search-ADAccount -PasswordExpiring -TimeSpan 14


