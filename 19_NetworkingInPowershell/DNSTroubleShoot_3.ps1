# DNS Troubleshooting:

<#
Very useful when:

Ping works by IP but not by name

Applications fail due to DNS issues
#>

Resolve-DnsName bing.com;

# Test DNS vs Network

Test-Connection 8.8.8.8 -Quiet -Count 1;
Resolve-DnsName google.com;

<#
If:

IP ping works

DNS fails

👉 You have a DNS problem, not network.
#>