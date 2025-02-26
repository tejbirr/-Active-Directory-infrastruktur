#Scriptet er hentet fra compendia i pensum, men er endret og tilpasset iforhold #tilorganisasjonskartet til bedriften min.
# https://gitlab.com/erikhje/heat-mono/-/raw/master/scripts/CreateUserCSV.ps1.\CreateUserCSV.ps1

#Scriptet brukes til adde nye brukere:
$ADUsers = Import-Csv takeawaycoreusers.csv -Delimiter ';'
foreach ($User in $ADUsers) {
  if (!(Get-ADUser -LDAPFilter `
      "(sAMAccountName=$($User.Username))")) {
    New-ADUser `
    -SamAccountName        $User.Username `
    -UserPrincipalName     $User.UserPrincipalName `
    -Name                  $User.DisplayName `
    -GivenName             $User.GivenName `
    -Surname               $User.SurName `
    -Enabled               $True `
    -ChangePasswordAtLogon $False `
    -DisplayName           $user.Displayname `
    -Department            $user.Department `
    -Path                  $user.path `
    -AccountPassword `
    (ConvertTo-SecureString $user.Password -AsPlainText -Force)
  }
}
# Scriptet for å telle opp antall brukere:
(Get-ADUser -Filter * | Measure-Object).Count
