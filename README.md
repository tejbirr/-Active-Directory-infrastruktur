# DCSG1005 Individuelt Prosjekt - Active Directory Infrastruktur

## Prosjektmål
Målet med prosjektet var å designe og implementere en Active Directory (AD) infrastruktur for en simulert bedrift kalt *takeaway.core*. Prosjektet fokuserte på:
- Opprettelse av en logisk og strukturert AD-infrastruktur
- Konfigurering av Organizational Units (OU), brukere og grupper
- Implementering av Group Policy for styring av maskiner og brukere

## Oppsett av Infrastruktur
Prosjektet bestod av fire Windows-maskiner koblet til en domenekontroller. AD-strukturen ble organisert i:
- **Bruker-OUer:** MRTeam, HR, ØKO, LederIT (med sub-OUene UtvTeam og ProgTeam)
- **Maskin-OUer:** Klienter (med sub-OUene Kons og Adm) og Servere
- **Sikkerhetsgrupper:** takeawayAssets for tilgangsstyring til ressurser som adgangskort, printere og filområder

## Utfordringer og Løsninger
1. **Brukeroppretting via PowerShell:** Feilmeldingen *"New-ADUser: Directory object not found"* oppstod pga. feil i CSV-filens OU-referanser. Løsningen var å korrigere scriptet som opprettet OUene.
2. **Oppretting av globale avdelingsgrupper:** Feilmeldingen *"Add-ADGroupMember: Cannot find an object with identity"* skyldtes bruk av feil gruppenavn. Løsningen var å bruke "Group name (pre-Windows 2000)" i stedet.

## Lærdom og Erfaring
Prosjektet var utfordrende, men lærerikt. Gjennom gjentatte konfigurasjoner og feilsøking fikk jeg bedre forståelse for AD, Group Policy og PowerShell. Det å følge et organisasjonskart nøye viste seg å være essensielt for en vellykket implementering.

## AI Bruk
Ingen AI-verktøy ble brukt i prosjektet. Veiledningsvideoer fra emnelæreren og hjelp fra læringsassistenter var avgjørende for gjennomføringen.

## Ressurser
- **Organisasjonskart:** [Se organisasjonskart](https://gitlab.stud.idi.ntnu.no/-/ide/project/tejbirs/dcsg1005-template-Project/edit/main/-/IMG-Bilde/Organisasjonskart.drawio__ferdig_.png)
- **Script for brukeroppretting:** [2_Adde-nye-brukere.ps1](https://gitlab.stud.idi.ntnu.no/tejbirs/dcsg1005-template-Project/-/raw/main/code/2_Adde-nye-brukere.ps1)
- **Script for TakeawayAssets-OUer:** [3_TakeawayAssets-OUer.ps1](https://gitlab.stud.idi.ntnu.no/tejbirs/dcsg1005-template-Project/-/raw/main/code/3_TakeawayAssets-OUer.ps1)
