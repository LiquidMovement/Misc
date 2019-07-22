#Connet to powershell on exchange on-prem: (always use your UPN as account name when asked for credentials. Ex. First.last@XXXX.com)
$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://XXXX/PowerShell/ -Authentication Kerberos -Credential $UserCredential
Import-PSSession $Session
#when done close session with
Remove-PSSession $Session