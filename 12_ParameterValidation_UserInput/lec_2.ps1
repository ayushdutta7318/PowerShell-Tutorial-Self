# how to take input from the user:

$name = Read-Host "Enter your name: ";

Write-Output "Hello, my name is $($name)";

# Secure password input:

$passwd = Read-Host "Enter Password: " -AsSecureString;

Write-Output "Password is: $($passwd)";


