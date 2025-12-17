# 🧩 PART B – IP CONFIGURATION

Get-NetAdapter;

# ip addr

Get-NetIPAddress

# filter ip v4:

Get-NetIPAddress -AddressFamily IPv4;
Get-NetIPAddress -AddressFamily IPv6;

# see full confign:

Get-NetIPConfiguration;

# or

ipconfig /all;