# Scriptet her hentet fra compendium i pensum, og deretter tilpasset etter takeaway #bedriften:
#kilden: https://gitlab.com/erikhje/dcsg1005/-/blob/master/compendia.md

# Det er scriptet for å importere Microsoft Security Baselines, deretter legge til GPO-maler
#       Security Baselines:
#     - Windows 10 version 22H2 Security Baseline
#     - Windows Server 2022 Security Baseline
#
# 7zip må installeres
#------------------------------------------------------------------------------------------

Set-Location C:\Users\Administrator\Desktop\
choco install -y 7zip

# the following should be on one line:
curl -O https://download.microsoft.com/download/8/5/C/85C25433-A1B0-4FFA-9429-7E023E7DA8D8/Windows%2010%20version%2022H2%20Security%20Baseline.zip

$filePath = '.\Windows%2010%20version%2022H2%20Security%20Baseline.zip'
7z x $filePath
Remove-Item $filepath
Set-Location .\Windows-10-v22H2-Security-Baseline\Scripts\
.\Baseline-ADImport.ps1
Get-GPO -All | Format-Table -Property displayname


Set-Location C:\Users\Administrator\Desktop\

# the following should be on one line:
curl -O https://download.microsoft.com/download/8/5/C/85C25433-A1B0-4FFA-9429-7E023E7DA8D8/Windows%20Server%202022%20Security%20Baseline.zip
$filePath = '.\Windows%20Server%202022%20Security%20Baseline.zip'
7z x $filePath
Remove-Item $filepath
Set-Location '.\Windows Server-2022-Security-Baseline-FINAL\Scripts\'
.\Baseline-ADImport.ps1
Get-GPO -All | Format-Table -Property displayname



Set-Location C:\Users\Administrator\Desktop\


# GPO-maler for alle ansatte og brukere
$OU = "OU=Servere,DC=takeaway,DC=core"
Get-GPO -Name "MSFT Windows 10 22H2 - Computer" | New-GPLink -Target $OU
Get-GPO -Name "MSFT Windows 10 22H2 - User" | New-GPLink -Target $OU
Get-GPO -Name "MSFT Windows 10 22H2 - BitLocker" | New-GPLink -Target $OU
Get-GPO -Name "MSFT Windows 10 22H2 - Defender Antivirus" | New-GPLink -Target $OU
Get-GPO -Name "MSFT Windows 10 22H2 - Domain Security" | New-GPLink -Target $OU
Get-GPO -Name "MSFT Windows 10 22H2 - Credential Guard" | New-GPLink -Target $OU


# GPO-maler til maskiner
$OU = "OU=Servere,DC=takeaway,DC=core"
Get-GPO -Name "MSFT Windows 10 22H2 - BitLocker" | New-GPLink -Target $OU
Get-GPO -Name "MSFT Windows 10 22H2 - Defender Antivirus" | New-GPLink -Target $OU
Get-GPO -Name "MSFT Windows 10 22H2 - Domain Security" | New-GPLink -Target $OU
Get-GPO -Name "MSFT Windows 10 22H2 - Credential Guard" | New-GPLink -Target $OU


# GPO-maler til servere (srv1)
$OU = "OU=Servere,DC=takeaway,DC=core"
Get-GPO -Name "MSFT Windows Server 2022 - Domain Controller" | New-GPLink -Target $OU
Get-GPO -Name "MSFT Windows Server 2022 - Domain Controller Virtualization Based Security" | New-GPLink -Target $OU
Get-GPO -Name "MSFT Windows Server 2022 - Domain Security" | New-GPLink -Target $OU
Get-GPO -Name "MSFT Windows Server 2022 - Member Server" | New-GPLink -Target $OU
Get-GPO -Name "MSFT Windows Server 2022 - Defender Antivirus" | New-GPLink -Target $OU
Get-GPO -Name "MSFT Windows Server 2022 - Member Server Credential Guard" | New-GPLink -Target $OU
