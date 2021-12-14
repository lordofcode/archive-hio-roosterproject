# archive-hio-roosterproject
NHL Hogere Informatica: 1997 - roosterproject

Auteurs: Dirk Hornstra, Remco Wolters, Vincent Damhuis, Vincent van Gelder

Samengevat: In Delphi gemaakte applicatie die lokalen, docenten en groepen (klassen) kan indelen.

Doel: archivering van "vroeger werk". pull-requests are not accepted.

Probleemstelling

Het programma dient de gegevens van lokalen, leraren en klassen te kunnen verwerken en lerarenroosters, lokalenroosters en studentenroosters uit te kunnen printen.

Randvoorwaarden

    de roosters dienen 6 maal per jaar gemaakt te worden.
    roosters van vorig jaar moeten weer in te lezen zijn en aan te passen.
    er dient onderhouds-/gebruikersdocumentatie gemaakt te worden.
    het gegeven algoritme kan gebruikt worden, maar als wij een algoritme kunnen maken dat beter werkt, dan mogen we dat gebruiken.

Verwoording

2.1.1    Verwoording Vakken (invoer)

In periode 2 wordt het vak Databasesystemen met afkorting DBS1 met werkvorm ic 2 lesuren per week gegeven aan groep HI1 door Ton de Winter met afkorting WiT in lokaal V205, V208 of V212a.

In periode 2 wordt het vak Gestructureerde Analyse met afkorting GEAN met werkvorm hc 2 lesuren gegeven aan groep HI2a door Wouter van der Ploeg met afkorting PIW in lokaal V056 of V052.

2.1.2    Verwoording Docenten (invoer)

In periode 2 is de docent Dick Bruin met afkorting BrD de gehele week beschikbaar.

In periode 2 is de docent Albert Sikkema met afkorting SiA de gehele week beschikbaar behalve vrijdag.

2.1.3    Verwoording Lokalen (invoer)

In periode 2 is lokaal V205 beschikbaar op maandag het 1e tot en met het 5e lesuur.

In periode 2 is lokaal V052 de gehele week beschikbaar.

2.1.4    Verwoording Klasserooster (uitvoer)

    Het rooster voor groep HI1c in periode 985 van de NHL fac. TEM heeft
    de datum 18-MAR-98.

    Groep HI1c heeft maandag het 1e uur het vak Analyse/Ontwerp/Real. 2,
    waarvan de werkvorm dp is en de docent DyJ in lokaal v103.
    
    Groep HI1c heeft maandag het 2e uur het vak Analyse/Ontwerp/Real. 2,
    waarvan de werkvorm dp is en de docent DyJ in lokaal v103.

    Groep HI1c heeft woensdag het 1e uur het vak Discrete Wiskunde,
    waarvan de werkvorm wc is en de docent LiM in lokaal v313.

    Groep HI1c heeft donderdag het 5e uur geen les.

2.1.5    Verwoording Docentrooster (uitvoer)

Het rooster voor JANSEN, J.M. in periode 985 van de NHL fac. TEM heeft de datum 18-MAR-98.

JANSEN, J.M. geeft maandag het 1e uur het vak Analyse/Ontwerp/Real. 2, waarvan de werkvorm dp is, aan de groep HI1c in lokaal v103.

JANSEN, J.M. geeft maandag het 7e uur het vak Functioneel Programmeren 2, waarvan de werkvorm dp is, aan de groep HI3a in lokaal v052.

2.1.6    Verwoording Lokalenrooster (uitvoer)

Het overzicht van lokaalbezetting in periode 985 van de NHL fac. TEM heeft de datum 18-MAR-98.

In lokaal v052 zit maandag het 1e uur geen groep.

In lokaal v052 zit maandag het 7e uur groep HI2c/HI2d.

Elementaire zinnen

2.2.1    Elementaire zinnen Vakken (invoer).

Het vak Databasesystemen heeft als afkorting DBS1.
  “     Gestructureerde Analyse      “      GEAN.

In periode 2 heeft groep HI1 het vak DBS1 met werkvorm ic 2 lesuren per week.
    “           HI2a              GEAN         “         hc 2        “

De docent Ton de Winter heeft als afkorting WiT.
    “    Wouter van der Ploeg    “    PIW.

In periode 2 heeft groep HI1 het vak DBS1 van Ton de Winter.
    “           HI2a               GEAN        Wouter van de Ploeg.

Het vak DBS1 met de werkvorm ic kan gegeven worden in lokaal V205.
   “     DBS1        “         ic        “        “         V208.

2.2.2    Elementaire zinnen Docenten (invoer).

In periode 2 is Dick Bruin beschikbaar de gehele week.
        “    Albert Sikkema    “  de gehele week.
        “    Ton de Winter     “  op dinsdagmiddag.

2.2.3    Elementaire zinnen Lokalen (invoer).

In periode 2 is lokaal V205 beschikbaar op dinsdag het 1e lesuur.
        “               V205                  dinsdag het 2e lesuur.

2.2.4    Elementaire zinnen Klasserooster (uitvoer)

Voor periode 985 is er op 18-MAR-98 een rooster gemaakt voor Groep HI1c.
   “         986     “     6-MEI-98           “            “          HI1d.

Groep HI1c heeft maandag het 1e uur het vak Analyse/Ontwerp/Real. 2 van DyJ.
        “             “      2e     “          “        “
         HI1d         “      5e      geen les.

Groep HI1c heeft maandag het 1e uur het vak Analyse/Ontwerp/Real. 2 in lokaal v103.
        “             “      2e     “          “        “        “
         HI1d         “      5e      geen les.

Het vak Analyse/Ontwerp/Real. 2 heeft als werkvorm dp.
        “      Programmeren        “           wc.

2.2.5    Elementaire zinnen Docentrooster (uitvoer)

Voor periode 985 is er op datum 18-MAR-98 een rooster gemaakt voor JANSEN, J.M.
        “                            “           SANTEMA, P.J.

JANSEN, J.M. geeft maandag het 1e uur het vak Analyse/Ontwerp/Real. 2 aan groep HI1c.
        “                   7e        “    Functioneel Programmeren 2    “    HI3a.

JANSEN, J.M. geeft maandag het 1e uur het vak Analyse/Ontwerp/Real. 2 in lokaal v103.
        “                    7e        “    Functioneel Programmeren 2    “  v052.

JANSEN, J.M. geeft woensdag het 5e uur geen les.

Het vak Analyse/Ontwerp/Real. 2 heeft als werkvorm dp.
        “      Programmeren        “           wc.

2.2.6    Elementaire zinnen Lokalenrooster (uitvoer)

Voor periode 985 is er op datum 18-MAR-98 een overzicht van lokaalbezetting gemaakt.

In lokaal v052 zit maandag het 1e uur geen groep.
    “            “ 7e       groep HI2c/HI2d.
    “ v210            “ 1e          “     HI1c.   
Lokaal v210 is maandag het 3e uur niet beschikbaar.

Structuur

2.3.1    Structuur Invoer.

    FeitType : Vakafkorting
        FTF : Het <vak> heeft als afkorting <afkorting>

        BegripType : Vak
            FTF : Er is een vak met <vaknaam>
            BTF : Vak <vaknaam>

        NaamType : Vaknaam
            NTF : <...>

        BegripType : Afkorting
            FTF : Er is een afkorting met <naam>
            BTF : Afkorting <naam>

        NaamType : Naam
            NTF : <...>

    FeitType : Vakperweek
        FTF : In <periode> heeft <groep> het <vak> met <werkvorm>
                  <aantal> lesuren per week

        BegripType : Periode
            FTF : Er is een periode met <periodenummer>
            BTF : Periode <periodenummer>

        NaamType : Periodenummer
            NTF : <...>

        BegripType : Groep
            FTF : Er is een groep met <naam>
            BTF : Groep <naam>

        BegripType : Werkvorm
            FTF : Er is een werkvorm met <afkorting>
            BTF : Werkvorm <afkorting>

        FeitType : Docentafkorting
        FTF : De <docent> heeft als afkorting <afkorting>

        BegripType : Docent
            FTF : Er is een docent met <naam>
            BTF : Docent <naam>


        FeitType : Vakgebied
        FTF : In <periode> heeft <groep> het <vak> van <docent>        

        FeitType : Lokaalvorm
        FTF : Het <vak> met <werkvorm> kan gegeven worden in <lokaal>

        BegripType : Lokaal
            FTF : Er is een lokaal met <nummer>

        FeitType : Docentbeschikbaar
        FTF : In <periode> is <docent> <dagaanduiding> aanwezig

        BegripType : Dagaanduiding
            FTF : Er is een dagaanduiding met <naam>

        FeitType : Lokaalbeschikbaar
        FTF : In <periode> is <lokaal> beschikbaar op <dagaanduiding>

2.3.2    Structuur Uitvoer.
        
        FeitType : Rooster-klas
        FTF : Voor <periode> is er op <datum> een rooster
                    gemaakt voor <groep>

        BegripType : Periode
        FTF : Er is een periode met <periodenummer>
        BTF : Periode <periodenummer>

        NaamType : Periodenummer
        NTF : <...>

        NaamType : Datum
        NTF : <...>
    
        Begriptype : Groep
        FTF : Er is een groep met <groepnaam>
        BTF : Groep <groepnaam>
    
        NaamType : Groepnaam
        NTF : <...>

        FeitType : College
        FTF : <groep> heeft <dagvanweek> het <uur> les van <docent>

        NaamType : Dagvanweek
        NTF : <...>

        BegripType : Uur
        FTF : Er is een uur <nummer>
        BTF : Uur <nummer>

        NaamType : Nummer
        NTF : <...>

        BegripType : Docent
        FTF : Er is een docent <naam>
        BTF : Docent <naam>

        NaamType : Naam
        NTF : <...>

FeitType : Lokaalindeling
            FTF : <groep> heeft <dagvanweek> het <uur> les in <lokaal>

            NaamType : Lokaal
                NTF : <...>

FeitType : Vakindeling
    FTF : <groep> heeft <dagvanweek> het <uur> <vak>

            NaamType : Vak
                NTF : <...>
        
FeitType : Werkvormindeling
    FTF : <groep> heeft <dagvanweek> het <uur> <werkvorm>

    NaamType : Werkvorm
        NTF : <...>

        FeitType : Rooster-docent
            FTF : Voor <periode> is er op <datum> een rooster
                       gemaakt voor <docent>

        FeitType: Lokaalbezetting
FTF: Het overzicht van lokaalbezetting voor <periode> is gemaakt op
         <datum>

        FeitType: Lokaal-beschikbaar
            FTF: Op <dagvandeweek> op <uur> is <lokaal> <welofniet> beschikbaar

            NaamType: Welofniet
                NTF: <...>

Vervolgens komt een NIAM-schema wat ik hier verder niet uitwerk.

Databasestructuur

We zien hier een tekening met blokjes, daarboven pijlen (het sleutelveld of combinatie van velden welke de sleutel vormen). Ik geef hier voor het gemak even de tekstuele weergave waarbij (K) aangeeft dat het een sleutelveld is (K -> Key);

Uren: Periode (K), Groep (K), Vak (K), Werkvorm (K), Uren .

Vakafkorting: Vak (K), Vakafkorting.

Lokaal: Vak (K), Werkvorm (K), Lokaal (K).

LokaalNB (niet beschikbaar): Periode (K), Lokaal (K), Dagvanweek (K), Uur (K).

Les: Periode (K), Groep (K), Dagvanweek (K), Uur (K), Docent (K), Lokaal (K), Vak, Werkvorm, Nummer.

Docent: Groep (K), Vak (K), Werkvorm (K), Docent (K).

Docentafkorting: Docent (K), Docentafkorting.

DocentNB (niet beschikbaar): Periode (K), Docent (K), Dagvanweek (K), Uur (K).

Lokaalbezetting: Periode (K), Datum.

Roosterdocent: Periode (K), Datum, Docent (K).

Roosterklas: Periode (K), Datum, Groep (K).

Zo te zien is dit niet het definitieve verslag geweest, want ik tel 8 invoertabellen en niet 7.

Menu-analyse

3.1    De menubalk

 De menubalk heeft de volgende menu’s:
•    Bestand
•    Invoer
•    Uitvoer
•    Help

3.2    Bestand-menu

Het menu Bestand is het eerste menu van de rooster planner. Dit menu bevat de  volgende submenu’s:
•    Nieuw
•    Open (n.a.)
•    Sluit
•    Opslaan (n.a.)
•    Opslaan als (n.a.)
•    Exit
Met Nieuw worden alle zeven invoerschermen geopend. Deze schermen zijn gekoppeld met de database.  
Door op Sluit te klikken worden alle openstaande schermen gesloten.
Met Exit word de Rooster planner gesloten.

3.3    Invoer-menu

Het volgende menu is het Invoer-menu. Hier wordt centraal de invoerschermen beheert. Alle zeven invoerschermen worden automatisch geopend als er op Nieuw wordt geklikt in het Bestand menu. De invoerschermen zijn individueel te openen of te selecteren via het invoer-menu.
De hierarchie is als volgt:

•    Docenten
•    Afkorting
•    Vakgebied
•    Beschikbaarheid
•    Vak
•    Afkorting
•    Uren
•    Lokalen
•    Type
•    Beschikbaarheid

3.4    Uitvoer-menu

Het Uitvoer-menu beheert de uitvoerschermen. Er zijn drie uitvoerschermen die tezamen de roosters vormen:

•    Docentenrooster
•    Groepenrooster
•    Lokalenrooster

Het menu-item roosteren dient om het roosteren te starten. Nadat er geroosterd is zijn de nieuwe roosters te bekijken via de drie bovengenoemde uitvoerschermen.
    
•    Roosteren

3.5    Help-menu

Via het help-menu kan men informatie vinden over de werking van de rooster planner. Op het moment bevat dit menu alleen nog maar het menu-item:

•    About

Hierin wordt enige summiere informatie gegeven over het programma en de makers.

Programma-analyse

4.1    Opbouw van het programma
    
Het programma is opgebouwd met behulp van een MDI-raamwerk. Het programma heeft een hoofdvenster waarin alle invoer en uitvoerschermen getoond worden. Er zijn zeven invoerschermen die overeenkomen met de zeven invoertabellen uit de database. Dit zijn de volgende invoerschermen:
•    Docenten
•    Vakken
•    Vakgebied
•    Beschikbaarheid lokalen
•    Beschikbaarheid docenten
•    uren
•    Lokaaltype
    
Er zijn drie uitvoerschermen, namelijk van het rooster van de docent, het rooster van de groepen en het rooster van de lokalen.

4.2    Invoerschermen

In de invoerschermen kunnen de gegevens worden ingevoerd in de database die nodig zijn om een rooster samen te stellen.

4.2.1    Docenten

In dit invoerscherm is het mogelijk om de naam en de afkorting van de docenten in te voeren, te wijzigen of te verwijderen uit de database.

4.2.2    vakken

In dit invoerscherm is het mogelijk om de naam en de afkorting van de vakken in te voeren, te wijzigen of te verwijderen uit de database.

4.2.3    Vakgebied

In dit invoerscherm kan ingevoerd worden welk vak met een bepaalde werkvorm door een welke docent kan worden gegeven in een bepaalde periode.

4.2.4     Beschikbaarheidlokalen

In dit invoervenster kan de per periode de beschikbaarheid van elk lokaal ingevoerd worden

4.2.5    Beschikbaarheiddocenten
    
In dit invoerscherm kan van de docent per periode worden ingevoerd welke uren hij/zij beschikbaar is.

4.2.6    Uren

Hier kan worden per periode worden ingevoerd welke groep welk vak met werkvorm heeft en hoeveel uren per week.

4.2.7    Lokaaltype

Hier kan worden ingevoerd welk lokaal geschikt is voor welk vak met werkvorm.

4.3    Uitvoer

Er zijn drie uitvoerschermen voor de roosters. Deze komen in principe met elkaar overeen en bestaan uit een databasegrid. Het docentenrooster kan geselecteerd worden per docent, het groepenrooster per groep en het lokalenrooster per lokaal.

Ontwerp

5.1    Rooster algoritme

Om een rooster te generen wordt gebruikt gemaakt van backtracking. De volgorde van de stappen zijn als volgt:

Check rooster	->	start met:
            	<-	groep, vak, werkvorm
	                ^ |
	                |  ˅
	                zoek docent:
                    groep, vak, werkvorm, docent
	                ^ |
	                |  ˅

Dag	            <-	zoek uur:
	            ->	groep, vak, werkvorm, docent, dag, uur
	                ^ |
	                |  ˅
	                zoek lokaal:
	                groep, vak, werkvorm, docent, dag, uur

Het bovenstaande werkt op basis van backtracking.