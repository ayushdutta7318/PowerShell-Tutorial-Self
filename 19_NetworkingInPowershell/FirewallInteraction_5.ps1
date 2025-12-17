# Basic Firewall interaction:

# View Firewall Status
Get-NetFirewallProfile;

# View Firewall Rules (Read-Only for Now)

Get-NetFirewallRule | Select-Object -Property DisplayName, Enabled;

