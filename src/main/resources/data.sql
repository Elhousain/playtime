drop table IF EXISTS spel;

create table spel(
id                  int 	        not null AUTO_INCREMENT,
naam       	        varchar(50)     not null,
foto                varchar(100)    null,
prijs               double          not null,
beschrijving        varchar(1000)   not null,
min_spelers         int             null,
max_spelers         int             null,
min_leeftijd        int             null,
taal                varchar(50)     null,
uitgever            varchar(50)     null,
primary key (id)
);


insert into spel(naam, foto, prijs,beschrijving,min_spelers,max_spelers,min_leeftijd,taal,uitgever)
values ('De Kolonisten Van Catan', 'images/catan.jpg', '41.00', 'De spelers proberen elk zo lucratief mogelijk het eiland ‘Catan’ te koloniseren door er straten, dorpen en steden op te plaatsen. Wie als eerste de noodzakelijke 10 zegepunten kan verzamelen, wint.', '3', '4', '13', 'Nederlands', '999 Games');
insert into spel(naam, foto, prijs,beschrijving,min_spelers,max_spelers,min_leeftijd,taal,uitgever)
values ('Clever', 'images/clever.jpg', '15.00', 'Tactisch dobbelspel voor het hele gezin. Dobbel en vul één van je geworpen dobbelstenen in de bijbehorende categorie in. Elke categorie levert op een andere manier punten op. Kies slim en let goed op de overgebleven dobbelstenen. Je moet namelijk elke dobbelsteen met een lager resultaat op het zilveren dienblad aan de andere spelers serveren. Die kunnen daardoor wellicht ook belangrijke punten scoren.', '1', '4', '5', 'Nederlands', '999 Games');
insert into spel(naam, foto, prijs,beschrijving,min_spelers,max_spelers,min_leeftijd,taal,uitgever)
values ( 'Smallworld', 'images/smallworld.jpg', '45.00', 'Kies een volk en betreedt Smal World om zoveel mogelijk gebieden te veroveren. Laat dit volk na enkel ronden aan zijn lot over en kies een nieuw volk met betere mogelijkheden om zegepunten te scoren.', '2', '5', '9', 'Engels', 'Days Of Wonder' );
insert into spel(naam, foto, prijs,beschrijving,min_spelers,max_spelers,min_leeftijd,taal,uitgever)
values ( 'Monopoly', 'images/monopoly.jpg', '30.00', ' De ingrediënten om te winnen zijn natuurlijk tactiek, maar ook een beetje geluk. Het doel van het spel is om groot te worden door straten te kopen, huizen en hotels te bouwen. Heb je altijd al rijk willen worden? Het kan met Monopoly! Koop le Meir in Antwerpen of de Nieuwstraat in Brussel. Bij veel mensen zal dit spel nostalgie opwekken, maar het is ook nog steeds een fantastisch spel om voor de eerste keer te spelen. Met het vingerhoedje, de laars, de oldtimer, de kruiwagen, het schip, de hoed, het hondje en een kat als pionnen. Voor een sneller spel kan je ook de geluksdobbelsteen gebruiken, naast de normale dobbelsteen. Je hebt dan kans om de bus of MR. Monopoly te dobbelen, hiermee kan je je sneller een weg over het bord banen.', '2', '8', '8', 'Nederlands', 'Jumbo' );