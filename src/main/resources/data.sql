drop table IF EXISTS gebruikerbordspel;
drop table IF EXISTS spel;
drop table IF EXISTS taal;
drop table IF EXISTS uitgever;
drop table IF EXISTS status;
drop table IF EXISTS gebruiker;
drop table IF EXISTS categorie;

create table taal(
id                  int             not null AUTO_INCREMENT,
beschrijving        varchar(20)     not null,
primary key (id)
);
create table uitgever(
id                  int             not null AUTO_INCREMENT,
beschrijving        varchar(20)     not null,
primary key (id)
);
create table status(
id                  int             not null AUTO_INCREMENT,
beschrijving        varchar(20)     not null,
primary key (id)
);
create table categorie(
id                  int             not null AUTO_INCREMENT,
beschrijving        varchar(20)     not null,
primary key (id)
);
create table spel(
id                  int 	        not null AUTO_INCREMENT,
naam       	        varchar(50)     not null,
foto                varchar(100)    null,
prijs               double          not null,
beschrijving        varchar(1000)   not null,
categorie           int             not null,
min_spelers         int             null,
max_spelers         int             null,
min_leeftijd        int             null,
taal                int             not null,
uitgever            int             not null,
status              int             not null,
voorraad_huur       int             not null,
voorraad_koop       int             not null,
primary key (id),
FOREIGN KEY (taal) REFERENCES taal(id),
FOREIGN KEY (uitgever) REFERENCES uitgever(id),
FOREIGN KEY (status) REFERENCES status(id),
FOREIGN KEY (categorie) REFERENCES categorie(id)
);
create table gebruiker(
id                  int             not null AUTO_INCREMENT,
voornaam            varchar(20)     not null,
achternaam          varchar(30)     not null,
geboortedatum       datetime        null,
rol                 varchar(10)     not null,
email               varchar(40)     not null,
paswoord            varchar(40)     not null,
telefoon            varchar(20)     null,
woonplaats          varchar(20)     not null,
postcode            varchar(10)     not null,
straat              varchar(40)     not null,
huisnummer          varchar(4)      not null,
primary key (id)
);
create table gebruikerbordspel(
id                  int             not null AUTO_INCREMENT,
spelid              int             not null,
gebruikerid         int             not null,
afhaaldatum         datetime        not null,
verwerkt            bool            not null,
ishuur              bool            not null,
aantal              int             not null,
primary key (id),
FOREIGN KEY (spelid) REFERENCES spel(id) ON DELETE CASCADE,
FOREIGN KEY (gebruikerid) REFERENCES gebruiker(id)
);




insert into taal(beschrijving)
values ( 'Nederlands' );
insert into taal(beschrijving)
values ( 'Engels' );
insert into taal(beschrijving)
values ( 'Frans' );

insert into uitgever(beschrijving)
values ( '999' );
insert into uitgever(beschrijving)
values ( 'Days of Wonder' );
insert into uitgever(beschrijving)
values ( 'Jumbo' );

insert into status(beschrijving)
values ( 'Archief' );
insert into status(beschrijving)
values ( 'Draft' );
insert into status(beschrijving)
values ( 'Actief' );

insert into categorie(beschrijving)
values ( 'dobbelspel' );
insert into categorie(beschrijving)
values ( 'bordspel' );
insert into categorie(beschrijving)
values ( 'kaartspel' );

insert into spel(naam, foto, prijs, beschrijving, categorie, min_spelers, max_spelers, min_leeftijd, taal, uitgever, status, voorraad_huur, voorraad_koop)
values ('Catan', 'images/catan.jpg', '41.00', 'De spelers proberen elk zo lucratief mogelijk het eiland ‘Catan’ te koloniseren door er straten, dorpen en steden op te plaatsen. Wie als eerste de noodzakelijke 10 zegepunten kan verzamelen, wint.', '3', '3', '4', '13', '1', '1', '3', '4', '10');
insert into spel(naam, foto, prijs, beschrijving, categorie, min_spelers, max_spelers, min_leeftijd, taal, uitgever, status, voorraad_huur, voorraad_koop)
values ('Clever', 'images/clever.jpg', '15.00', 'Tactisch dobbelspel voor het hele gezin. Dobbel en vul één van je geworpen dobbelstenen in de bijbehorende categorie in. Elke categorie levert op een andere manier punten op. Kies slim en let goed op de overgebleven dobbelstenen. Je moet namelijk elke dobbelsteen met een lager resultaat op het zilveren dienblad aan de andere spelers serveren. Die kunnen daardoor wellicht ook belangrijke punten scoren.', '1', '1', '4', '5', '1', '1', '3', '2', '7');
insert into spel(naam, foto, prijs, beschrijving, categorie, min_spelers, max_spelers, min_leeftijd, taal, uitgever, status, voorraad_huur, voorraad_koop)
values ( 'Smallworld', 'images/smallworld.jpg', '45.00', 'Kies een volk en betreedt Smal World om zoveel mogelijk gebieden te veroveren. Laat dit volk na enkel ronden aan zijn lot over en kies een nieuw volk met betere mogelijkheden om zegepunten te scoren.', '2', '2', '5', '9', '2', '2', '3', '3', '3' );
insert into spel(naam, foto, prijs, beschrijving, categorie, min_spelers, max_spelers, min_leeftijd, taal, uitgever, status, voorraad_huur, voorraad_koop)
values ( 'Monopoly', 'images/monopoly.jpg', '30.00', ' De ingrediënten om te winnen zijn natuurlijk tactiek, maar ook een beetje geluk. Het doel van het spel is om groot te worden door straten te kopen, huizen en hotels te bouwen. Heb je altijd al rijk willen worden? Het kan met Monopoly! Koop le Meir in Antwerpen of de Nieuwstraat in Brussel. Bij veel mensen zal dit spel nostalgie opwekken, maar het is ook nog steeds een fantastisch spel om voor de eerste keer te spelen. Met het vingerhoedje, de laars, de oldtimer, de kruiwagen, het schip, de hoed, het hondje en een kat als pionnen. Voor een sneller spel kan je ook de geluksdobbelsteen gebruiken, naast de normale dobbelsteen. Je hebt dan kans om de bus of MR. Monopoly te dobbelen, hiermee kan je je sneller een weg over het bord banen.', '2', '2', '8', '8', '1', '3', '1', '0', '0' );

insert into gebruiker(voornaam, achternaam, geboortedatum, rol, email, paswoord, telefoon, woonplaats, postcode, straat, huisnummer)
values ( 'Elhousain', 'Farah', '1989-04-17', 'ROLE_ADMIN', 'r0797083@student.thomasmore.be', 'test', '014444444', 'Beringen', '3580', 'Hoogstraat', '32' );
insert into gebruiker(voornaam, achternaam, geboortedatum, rol, email, paswoord, telefoon, woonplaats, postcode, straat, huisnummer)
values ( 'Bulent', 'Arslan', '1989-08-23', 'ROLE_ADMIN', 'r0792355@student.thomasmore.be', 'test', '0433333333', 'Beringen', '3580', 'Laagstraat', '40' );
insert into gebruiker(voornaam, achternaam, geboortedatum, rol, email, paswoord, telefoon, woonplaats, postcode, straat, huisnummer)
values ( 'Tom', 'Scheyltjens', '1989-03-18', 'ROLE_USER', 's0200162@thomasmore.student.be', 'test', '0472743607', 'Vosselaar', '2350', 'Grootheidestraat', '23' );

insert into gebruikerbordspel(spelid, gebruikerid, afhaaldatum, verwerkt, ishuur, aantal)
values ( '1', '3', '2020-11-01', 'true', 'true', '1' );
insert into gebruikerbordspel(spelid, gebruikerid, afhaaldatum, verwerkt, ishuur, aantal)
values ( '2', '2', '2020-11-01', 'true', 'false', '1' );
insert into gebruikerbordspel(spelid, gebruikerid, afhaaldatum, verwerkt, ishuur, aantal)
values ( '2', '3', '2020-11-01', 'false', 'false', '2' );