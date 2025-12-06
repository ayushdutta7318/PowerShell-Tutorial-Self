# Variables Datatypes and operators:

$name = "Ayush";
$name;

$Age = 27;
$Age;

$IsAdmin = $true;
$IsAdmin;

# print variable name aliter:
Write-Host "---------------------------------";
Write-Output $name;
Write-Output $Age;
Write-Output $IsAdmin;

##############################################################
# 4.4 Data Types in PowerShell:

# PowerShell automatically assigns types, but knowing them matters.

# Common types:

# Type	        Examples	Notes
# String	        "Hello"	    Text inside quotes
# Integer	        10	        Whole numbers
# Double/Float	3.14	    Decimal numbers
# Boolean	     $true, $false	Logical values
# Array	        1,2,3	    List of items
# Object	Output from most cmdlets    More advanced

# Operators: +,-,*,/,%

Write-Host "------------------------------------";
$a = 5;
$b = 30;

$result1 = $a + $b;
$result2 = $a - $b;
$result3 = $a * $b;
$result4 = $a / $b;
$result5 = $a % $b;

Write-Output $result1, $result2, $result3, $result4, $result5;


# Logical operators:

$age = 27;

($age -gt 18) -and ($age -lt 60);

# Arrays:

Write-Host "-----------------------------------------";

$friends = "ayush", "aman", "suresh";

Write-Output $friends;

# or array can be declared as:
Write-Host "------------------------------------"
$fr = @("ayush", "suresh", "jamie");

Write-Output $fr;

# Access array elements:
Write-Host "------------------------------------"
$friends[0];

Write-Host "Length of friends array is $($friends.Length)";

Write-Host "Hello $name";
Write-Host 'Hello $name';

$Age -ne 10;