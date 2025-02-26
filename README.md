DCSG1005 Individuell Prosjekt 

## Mål for Prosjektet: 

Målet for prosjektet var å lage en liten eller medium stor bedrift som skulle ha en fin design når det gjelder organisasjonens/bedriftens struktur. Oppgaven går ut på hvordan kan man lage en enkel og logisk Active Directory infrastruktur. Inn i infrastrukturen så skal man kunne klare å lage OUene, legge til brukere og ikke minst lage grupper av disse. I tillegg til dette så skal man kunne lage en Group Policy som kan hjelpe i styre maskinene og brukere i domenet kontroller.    

## Selve Prosjektet: Slik satt jeg opp organisasjonen min og ga navnet takeaway.core 

Det jeg gjorde aller først var å installere eller lage en Active Directory, der strukturen/infrastruktur var slik at alle fire Windows maskinene var koblet til en domene kontroller. Og kunne styres av kun den. Videre skilte jeg opp min takeawayBrukere strukturen i seks deler. Det var fire hoved OUer der to av dem var underklasser/subklasser. De hoved fire OUer ble MRTeam, HR, ØKO, og LederIT. Videre under LederIT klassen så hadde jeg to subklasser som ble kalt UtvTeam og ProgTeam. Deretter lagde jeg to hoved OUer innen takeawayMaskiner og to underklasser under en av dem. Den ene Ouen ble kalt etter Klienter og den andre ble kalt etter Servere. Under Klienter så lagde jeg to underklasser, hvor den ene ble kalt etter Kons (altså konsulenters pcer) og den andre etter Adm (administartors pcer). Deretter brukte jeg takeawayAssets til å samle sikkerhetsgrupper til ulike assetsene som adgangskort, printere og filområder.  

## Mine tanker rundt prosjektet: 

Når jeg skulle lage alle fire Windows maskinene om igjen og om igjen på video, så trodde jeg at det skulle være veldig vanskelig. Men i motsetning så gjorde det at jeg fikk oppfriska hukommelsen min og fikk en fin start på prosjektet. Jeg likte denne utfordringen til å lage alt fra bunnen av og syntes dette var et fint prosjekt som hadde god blanding av det å gjøre flere ting samtidig, som det egentlig er i den virkelige verden. Bare sånn det er sagt at dette på ingen måte var en lett oppgave, men heller en veldig utfordrende, lærerikt, og full av spennende opplevelser som krevde mye tålmodighet fra en. 

Da jeg først begynte med prosjektet så det første utfordringen var jo det å sette opp alle maskinene, men i forhold til organisasjonskart. Selv om vi hadde lært om dette tidligere, men likevel var det krevende å sette opp en active directory for en valgt bedrift.  

Men den første ordentlige utfordringen min var når jeg prøvde å lage brukere til domene kontroller. Fordi da fikk jeg flere feil meldinger på rad og rekke. Jeg fikk ordnet opp i de fleste feilene selv, men likevel var det en feilmedling som dukka opp konstant. Det var at “New-ADUser: Directory object not Found”, denne meldingen kom alltid opp uansett hvor mye jeg hadde endret. Men så fikk jeg hjelp fra en læringsassistent, og han dette her etter en god forklaring om problemet “Directory object not found kommer som regel når den ikke finner OU’en. Sjekk om noen av brukerne i .CSV Filen har feil OU’er”. Og da skjønte jeg at hvor feilen egentlig ligger, fordi før denne samtalen hadde ikke engang tenkt over at det var ikke scriptet som jeg kjørte nå var feil, men heller det andre scriptet som jeg brukte for å lage OUene.  

Etter å undersøke problemet grundig så bestemte jeg meg å bygge og koble sammen alle de fire maskinene på nytt og kjørte da den riktige scriptet, som hadde riktig “path” i seg. Men denne gangen i prosessen å lage de maskinene så følte jeg en stor mestringsfølelse, og klarte å bygge opp og koble samme alle maskinene under en time. Det som var forskjellen denne gangen var at jeg fulgte organisasjonskartet grundig gjennom. Så at jeg trengte sette to av OUene mine som subklasser av “LederIT”. Her er [Organisasjonskartet.drawio ferdig](https://gitlab.stud.idi.ntnu.no/-/ide/project/tejbirs/dcsg1005-template-Project/edit/main/-/IMG-Bilde/Organisasjonskart.drawio__ferdig_.png ) 

Her er det nye New-ADUser scriptet som jeg fikk fisket på kjørte den uten feil [2_Adde-nye-brukere](https://gitlab.stud.idi.ntnu.no/tejbirs/dcsg1005-template-Project/-/raw/main/code/2_Adde-nye-brukere.ps1 ) 

Den andre feil meldingen som jeg brukte mye tid på å løse var da jeg prøvde å lage globale avdelingsgrupper i de lokale TakeawayAssets-gruppene. Fordi da jeg kjørte scriptet mitt så kunne den ikke finne et objekt med identity, feil meldingen var som følgende “(“Add-ADGroupMember: Cannot find an object with identity: “LederIT”)”. Etter lang utførsking og mye tålmodighet så klarte jeg å forstå at feilen var i selve navnet til identiteten. Fordi tydligvis så var det forskjellige navn på selve gruppen enn det eg hadde forventet. Jeg trodde at jeg skulle bruke samme OU navnet som jeg hadde brukt overalt. Men her måtte jeg bytte det til det som sto etter “Group name (pre-Windows 2000)". Så jeg misforsto dette, og endte opp med å bruke masse tid. Her er det scriptet som fungerte tilsutt[TakeawayAssets-OUer](https://gitlab.stud.idi.ntnu.no/tejbirs/dcsg1005-template-Project/-/raw/main/code/3_TakeawayAssets-OUer.ps1)

## Avsnitt om AI Bruk:

Jeg har ikke brukt Chatgpt eller lignende hjelpemidler for dette prosjektet. Det var ikke et bestemt valg, men da jeg kom utover i arbeidet med prosjektet, så innså jeg at for det første så hjalp emnelærer sine videoer skikkelig til å komme i gang med prosjektet. Siden nesten alt var nytt for meg, så ble disse videoene en mindre stressene rute å ta. Jeg på ingen måte sier at det er det eneste jeg brukte for prosjektet, men ville bare si at det var en av de gode virkemidlene ute når det gjaldt dette prosjektet.  

For det andre så tok jeg i bruk læringsassistentene aktivt gjennom hele prosjektet. Det var en fin ordning med de timene som vi fikk til å jobbe med dette prosjektet. På grunn av disse timene så ble jeg litt mindre stresset og angsten til å gjøre noe helt nytt ble til en roligere overgang. Jeg vil ta denne anledningen til å takke alle læringsassistentene også, fordi uten de så kunne ikke jeg ha fulført prosjektet. Det var en skikkelig arbeidsinnsats på deres vegne.   

## Tilleggskommentarer: 

Da jeg så størrelsen på oppgaven så første tankene var å jobbe sammen med noen flere enn bare meg. Men når jeg begynte med prosjektet så innså jeg at egentlig jeg jobber bedre alene, og kan faktisk klare dette her alene. Deretter har jeg ikke sett tilbake og bare jobbet og jobbet for å gjøre dette best mulig.
