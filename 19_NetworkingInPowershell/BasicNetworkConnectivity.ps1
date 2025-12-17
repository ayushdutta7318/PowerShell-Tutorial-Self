# Basic Netowrk Connectivity:

# test basic connection:

Test-Connection google.com;

# quiet mode:

Test-Connection google.com -Quiet -Count 1;


# ping multiple servers:

"google.com", "bing.com", "bnvdjkfhbvd.com" | ForEach-Object {
    if(Test-Connection $_ -Quiet -Count 1){
        Write-Output "$($_) is reachable"
    }else{
        Write-Output "$($_) is unreachable";
    }
}

<#
19.2 Why Test-Connection Is Better Than ping
Feature	ping.exe	Test-Connection
Script-friendly	❌	✅
Returns objects	❌	✅
Quiet boolean	❌	✅

As an admin, always prefer Test-Connection.
#>

