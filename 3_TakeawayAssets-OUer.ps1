#TakeawayAssets OU
New-ADOrganizationalUnit "TakeawayAssets" -Description "Har grupper for tilgang til assets (printer, adgangskort)"

#TakeawayAssets AD grupper
New-ADGroup -GroupScope Global -Name "globl_LederIT" -DisplayName "Local LederITusers" -Description "LederTeknologi Sikkerhetsgruppen"
-Path "OU=LederIT,OU=Brukere,DC=takeaway,DC=core"
New-ADGroup -GroupScope Global -Name "globl_ØKO" -DisplayName "Local Økonomiusers" -Description "Økonomi Sikkerhetsgruppen"
-Path "OU=ØKO,OU=Brukere,DC=takeaway,DC=core"
New-ADGroup -GroupScope Global -Name "globl_DMTeam" -DisplayName "Local DMTeamusers"-Description "Digital Markedsføring Team Sikkerhetsgruppen"
-Path "OU=DMTeam,OU=Brukere,DC=takeaway,DC=core"
New-ADGroup -GroupScope Global -Name "globl_HR" -DisplayName "Local HRusers" -Description"HR Sikkerhetsgruppen"
-Path "OU=HR,OU=Brukere,DC=takeaway,DC=core"
New-ADGroup -GroupScope Global -Name "globl_UtvTeam" -DisplayName "Local UtvTeamusers" -Description "Utvikler Team Sikkerhetsgruppen"
-Path "OU=UtvTeam,OU=LederIT,OU=Brukere,DC=takeaway,DC=core"
New-ADGroup -GroupScope Global -Name "globl_ProgTeam" -DisplayName "Local ProgTeamusers" -Description "Programvare Team Sikkerhetsgruppen"
-Path "OU=ProgTeam,OU=LederIT,OU=Brukere,DC=takeaway,DC=core"


#CL1 (Kjør som Administrator):
Add-LocalGroupMember -Group "Remote Desktop Users" `
  -Member 'TAKEAWAY.CORE\globl_LederIT'
Add-LocalGroupMember -Group "Remote Desktop Users" `
  -Member 'TAKEAWAY.CORE\globl_UtvTeam'
Add-LocalGroupMember -Group "Remote Desktop Users" `
  -Member 'TAKEAWAY.CORE\globl_ProgTeam'
Add-LocalGroupMember -Group "Remote Desktop Users" `
  -Member 'TAKEAWAY.CORE\globl_HR'
Add-LocalGroupMember -Group "Remote Desktop Users" `
  -Member 'TAKEAWAY.CORE\globl_ØKO'
Add-LocalGroupMember -Group "Remote Desktop Users" `
  -Member 'TAKEAWAY.CORE\globl_DMTeam'


# Tilganger til Printere og Adgangskortene:
New-ADGroup -GroupScope DomainLocal -Name "Printere" -Description "Tilgang til alle printere" -Path "OU=TakeawayAssets,DC=takeaway,DC=core"
New-ADGroup -GroupScope DomainLocal -Name "Adgangskort" -Description "Tilgang til alle bygget" -Path "OU=TakeawayAssets,DC=takeaway,DC=core"

New-ADGroup -GroupScope DomainLocal -Name "LederIT_Filomraadet" -Description "Tilgang til LederIT Filomraadet" -Path "OU=TakeawayAssets,DC=takeaway,DC=core"
New-ADGroup -GroupScope DomainLocal -Name "UtvTeam_Filomraadet" -Description "Tilgang til UtvTeam Filomraadet" -Path "OU=TakeawayAssets,DC=takeaway,DC=core"
New-ADGroup -GroupScope DomainLocal -Name "ProgTeam_Filomraadet" -Description "Tilgang til ProgTeam Filomraadet" -Path "OU=TakeawayAssets,DC=takeaway,DC=core"
New-ADGroup -GroupScope DomainLocal -Name "DMTeam_Filomraadet" -Description "Tilgang til alle DMTeam Filomraadet" -Path "OU=TakeawayAssets,DC=takeaway,DC=core"
New-ADGroup -GroupScope DomainLocal -Name "HR_Filomraadet" -Description "Tilgang til alle HR Filomraadet" -Path "OU=TakeawayAssets,DC=takeaway,DC=core"
New-ADGroup -GroupScope DomainLocal -Name "ØKO_Filomraadet" -Description "Tilgang til alle Økonomi Filomraadet" -Path "OU=TakeawayAssets,DC=takeaway,DC=core"

# Lager globale avdelingsgrupper i de lokale TakeawayAssets-gruppene:
Add-ADGroupMember -Identity "Printere" -Members "globl_LederIT","globl_UtvTeam","globl_ProgTeam","globl_DMTeam","globl_HR","globl_ØKO"
Add-ADGroupMember -Identity "Adgangskort" -Members "globl_LederIT","globl_UtvTeam","globl_ProgTeam","globl_DMTeam","globl_HR","globl_ØKO"

Add-ADGroupMember -Identity "LederIT_Filomraadet" -Members "globl_LederIT"
Add-ADGroupMember -Identity "UtvTeam_Filomraadet" -Members "globl_UtvTeam","globl_LederIT"
Add-ADGroupMember -Identity "ProgTeam_Filomraadet" -Members "globl_ProgTeam","globl_LederIT"
Add-ADGroupMember -Identity "DMTeam_Filomraadet" -Members "globl_DMTeam","globl_LederIT"
Add-ADGroupMember -Identity "HR_Filomraadet" -Members "globl_HR","globl_LederIT"
Add-ADGroupMember -Identity "ØKO_Filomraadet" -Members "globl_ØKO","globl_LederIT"
