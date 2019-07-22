$FirstName = Read-Host "Enter New Users First Name "
$LastName = Read-Host "Enter New Users Last Name "
$Date = get-date -Format dd
$firstInitial = $FirstName.Substring(0,1)
$x = $false

while($x -eq $false){

    $UserType = Read-Host "Is this user a Standard User (Y) or IT Staff (N)? ( Y / N)"

    if($UserType -eq "Y"){
        $OrganizationalUnit = "corp.XXXX.com/Staff"
        $x = $true
    }
    if($UserType -eq "N"){
        $OrganizationalUnit = "corp.XXXX.com/IT"
        $x = $true
    }
    else{
        Write-Host "Invalid Entry - Please enter 'Y' or 'N'."
    }
}

$Name = "$LastName, $FirstName"
$Alias = "$firstInitial$LastName"
$UserPrincipalName = "$FirstName.$LastName@XXXX.com"
$SAMAccountName = $Alias
$Password = "Today@$date"

#New-MailBox -Name "$Name" -Alias "$Alias" -OrganizationalUnit "$OrganizationalUnit" -UserPrincipalName "$UserPrincipalName" -SAMAccountName "$SAMAccountName" -FirstName "$FirstName" -LastName "$LastName" -ResetPasswordOnNextLogon $true -Password "$Password" -Archive $false

Write-Host "New-Mailbox -Name $Name 
-Alias $Alias 
-OrganizationalUnit $OrganizationalUnit 
-UserPrincipalName $UserPrincipalName" 
Write-Host "-SAMAccountName $SAMAccountName 
-FirstName $FirstName 
-LastName $LastName 
-Password $Password"