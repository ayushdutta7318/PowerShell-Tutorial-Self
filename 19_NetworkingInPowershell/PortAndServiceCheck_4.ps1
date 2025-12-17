# port and service check:

# test tcp port

Test-NetConnection google.com -Port 443;

# Returns: TcpTestSucceeded = True / False

# scipt firndly version:

$connection = Test-NetConnection google.com -Port 443;

$connection.TcpTestSucceeded;

<#
Common ports in powershell:

| Port | Service |
| ---- | ------- |
| 80   | HTTP    |
| 443  | HTTPS   |
| 3389 | RDP     |
| 22   | SSH     |
| 53   | DNS     |

#>