# test connection

function Test-NetworkConnection{
    param(
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [string]$Website
    )

    begin{
        Write-Output "Test begins here...";
    }
    process{
        if(!(Test-Connection $Website -Quiet -Count 1)){
        Write-Output "$_ is not reachable";
        return;
    }

    if(!(Resolve-DnsName $Website -ErrorAction SilentlyContinue)){
        Write-Output "$_ not reachable";
        return;
    }

    if(!(Test-NetConnection $Website -Port 443)){
        Write-Output "$_ connection failed";
        return;
    }
    }
    end{
        Write-Output "Test completed";
    }

}


$webname = Read-Host "web name ";

Test-NetworkConnection -Website $webname;

"google.com", "bing.com", "hjbvfsdjhb.com" | Test-NetworkConnection;