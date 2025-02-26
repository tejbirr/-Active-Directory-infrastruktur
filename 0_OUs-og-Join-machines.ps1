# Brukere OUs (logge inn som "Domain Administrator" på DC1):
New-ADOrganizationalUnit 'Brukere' -Description 'Inneholder OUs and users'
 New-ADOrganizationalUnit 'LederIT' -Description 'Leder Teknologiteam' `
   -Path 'OU=Brukere,DC=takeaway,DC=core'
 New-ADOrganizationalUnit 'UtvTeam' -Description 'Utvikler Team' `
   -Path 'OU=LederIT,OU=Brukere,DC=takeaway,DC=core'
 New-ADOrganizationalUnit 'ProgTeam' -Description 'Program Team' `
   -Path 'OU=LederIT,OU=Brukere,DC=takeaway,DC=core'
 New-ADOrganizationalUnit 'DMTeam' -Description 'Digital Markedsføring Team' `
   -Path 'OU=Brukere,DC=takeaway,DC=core'
 New-ADOrganizationalUnit 'ØKO' -Description 'Økonomi' `
  -Path 'OU=Brukere,DC=takeaway,DC=core'
 New-ADOrganizationalUnit 'HR' -Description 'HR' `
   -Path 'OU=Brukere,DC=takeaway,DC=core'
# Maskiner OUs
New-ADOrganizationalUnit 'Klienter' `
  -Description 'Inneholder OUene and bruker PCer'
New-ADOrganizationalUnit 'Severe' `
  -Description 'Inneholder OUene and Severe'
New-ADOrganizationalUnit 'Adm' -Description 'Adm PCer' `
  -Path 'OU=Klienter,DC=takeaway,DC=core'
New-ADOrganizationalUnit 'Kons' -Description 'Konsulent PCer' `
  -Path 'OU=Klienter,DC=takeaway,DC=core'

# Flytte MGR, CL1, SRV1 maskinene under riktig OUene der de tilhører, iforhold til Organisasjonskartet mitt.
Get-ADComputer "MGR" |
  Move-ADObject -TargetPath "OU=Adm,OU=Klienter,DC=takeaway,DC=core"
Get-ADComputer "CL1" |
  Move-ADObject -TargetPath "OU=Kons,OU=Klienter,DC=takeaway,DC=core"
Get-ADComputer "SRV1" |
  Move-ADObject -TargetPath "OU=Severe,DC=takeaway,DC=core"
