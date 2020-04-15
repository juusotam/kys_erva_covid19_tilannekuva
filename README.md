# KYS ERVA COVID-19 tilannekuvaraportti

Tässä on kuvattu koodit ja tietosisällöt KYS:n erityisvastuualueen (ERVA) COVID-19 tilannekuvan raportoimiseksi.

Tietosisältö sisältää THL:n 25.3.2020 toimittamat muuttujat.

Muuttujakuvaus löytyy dokumentista `thl.covid19.tietosisalto.json`. **Tämä dokumentti sisätää THL:n toimittaman sisällön ja lisäksi KYS ERVA alueen omia tilannekuvakysymyksiä.**

Koodin suorittamista varten tarvitaan `RStudio` ympäristö.

## Työnkulku

- Ohjelma käynnistetään `build.R` tiedostossa olevalla komennolla
- Luetaan `data` hakemistosta `SecApp`:in tuottaman CSV-tiedoston.
- Tehdään muuttujien nimeämisiä ja hieman siivoamista
- Muodostetaan `MS WORD` dokumentti `output` hakemistoon ja nimetään päivämäärän mukaan

Tämän jälkeen raportti voidaan toimittaa eteenpäin turvapostilla sitä tarvitseville. Työnkulku on kuvattu kuvana `doumentation` kansiossa.

## Dokumentaatio

Dokumentaatio löytyy kansiosta `documentation`. BPMN-kaavio on piirretty käyttäen [Camunda Modeler](https://camunda.com/download/modeler/) ohjelmistoa.