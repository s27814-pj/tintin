CREATE TABLE Adres
(
    ID             INT PRIMARY KEY AUTO_INCREMENT,
    Miejscowosc    VARCHAR(30),
    Kraj           VARCHAR(30),
    Planeta        VARCHAR(30),
    `Kod pocztowy` VARCHAR(6)
);

CREATE TABLE Pracownik
(
    ID            INT PRIMARY KEY AUTO_INCREMENT,
    Imie          VARCHAR(30),
    Nazwisko      VARCHAR(30),
    Wynagrodzenie NUMERIC(8, 2),
    FK_Adres      INT,
    FOREIGN KEY (FK_Adres) REFERENCES Adres (ID)
);

INSERT INTO Adres(ID, Miejscowosc, Kraj, Planeta, `Kod pocztowy`)
VALUES (1, "Starogard", "Polska", "Ziemia", "83-200");
INSERT INTO Pracownik(ID, Imie, Nazwisko, Wynagrodzenie, FK_Adres)
VALUES (1, "Grzegorz", "Grzegorzowy", 5555, 1);


CREATE TABLE Klient
(
    ID       INT PRIMARY KEY AUTO_INCREMENT,
    Imie     VARCHAR(30),
    Nazwisko VARCHAR(30),
    Wartosc  NUMERIC(8, 2),
    FK_Adres INT,
    FOREIGN KEY (FK_Adres) REFERENCES Adres (ID)
);

INSERT INTO Klient(Imie, Nazwisko, Wartosc, FK_Adres)
VALUES ("Gertruda", "Grzegorzowa", 5555, 1),
       ("Gabriel", "Gabrielowy", 45213, 1);




CREATE TABLE Budynek
(
    ID                   INT AUTO_INCREMENT,
    Nazwa                VARCHAR(30),
    `Max pojemnosc [kg]` NUMERIC(8, 2) NOT NULL,
    `Max klientow [szt]` INT           NOT NULL,
    `Koszt utrzymania`   NUMERIC(8, 2),
    PRIMARY KEY (ID)
);

ALTER TABLE Pracownik ADD COLUMN FK_Budynek INT;
ALTER TABLE Pracownik
ADD FOREIGN KEY (FK_Budynek) REFERENCES Budynek(ID);

ALTER TABLE klient ADD COLUMN FK_Budynek INT;
ALTER TABLE klient
ADD FOREIGN KEY (FK_Budynek) REFERENCES Budynek(ID);

CREATE TABLE Maszyna
(
    ID               INT AUTO_INCREMENT,
    Nazwa            VARCHAR(30),
    `Czas 1 uzycia`  TIME,
    `Koszt 1 uzycia` NUMERIC(8, 2),
    CzySprawna       BOOLEAN,
    PRIMARY KEY (ID)
);

CREATE TABLE Pracownik_Maszyna
(
    ID           INT AUTO_INCREMENT,
    FK_Pracownik INT,
    FK_Maszyna   INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (FK_Pracownik) REFERENCES Pracownik (ID),
    FOREIGN KEY (FK_Maszyna) REFERENCES Maszyna (ID)
);

CREATE TABLE Zamowienie
(
    ID                INT AUTO_INCREMENT,
    Nazwa             VARCHAR(30),
    Cena              NUMERIC(8, 2),
    Waga              NUMERIC(8, 2),
    `Data realizacji` DATE,
    PRIMARY KEY (ID)
);

CREATE TABLE Zamowienie_Maszyna
(
    ID            INT AUTO_INCREMENT,
    FK_Zamowienie INT,
    FK_Maszyna    INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (FK_Zamowienie) REFERENCES Zamowienie (ID),
    FOREIGN KEY (FK_Maszyna) REFERENCES Maszyna (ID)
);


CREATE TABLE Dostawca
(
    ID                      INT AUTO_INCREMENT,
    Nazwa                   VARCHAR(30),
    `Koszt dostawy`         NUMERIC(8, 2),
    `Marza na komponencie`  NUMERIC(8, 6),
    `Dzien tygodnia dosawy` ENUM("PON", "WT", "SR", "CZW", "PT"),
    PRIMARY KEY (ID)
);
CREATE TABLE Komponenty
(
    ID               INT AUTO_INCREMENT,
    Nazwa            VARCHAR(30),
    Cena             NUMERIC(8, 2),
    Waga             NUMERIC(8, 2),
    `Ilosc dostepna` INT,
    FK_Dostawca      INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (FK_Dostawca) REFERENCES Dostawca (ID)
);

CREATE TABLE Zamowienie_Komponenty
(
    ID            INT AUTO_INCREMENT,
    FK_Zamowienie INT,
    FK_Komponenty INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (FK_Zamowienie) REFERENCES Zamowienie (ID),
    FOREIGN KEY (FK_Komponenty) REFERENCES Komponenty (ID)
);
   

insert into Adres (Miejscowosc, Kraj, Planeta, `Kod pocztowy`) values ('Xiangjia', 'China', 'Asclepiadaceae', null);
insert into Adres (Miejscowosc, Kraj, Planeta, `Kod pocztowy`) values ('Morani', 'Macedonia', 'Acarosporaceae', '2436');
insert into Adres (Miejscowosc, Kraj, Planeta, `Kod pocztowy`) values ('Végueta', 'Peru', 'Rhamnaceae', null);
insert into Adres (Miejscowosc, Kraj, Planeta, `Kod pocztowy`) values ('Xichang', 'China', 'Asclepiadaceae', null);
insert into Adres (Miejscowosc, Kraj, Planeta, `Kod pocztowy`) values ('Cileuya', 'Indonesia', 'Thelotremataceae', null);
insert into Adres (Miejscowosc, Kraj, Planeta, `Kod pocztowy`) values ('Amarete', 'Bolivia', 'Poaceae', null);
insert into Adres (Miejscowosc, Kraj, Planeta, `Kod pocztowy`) values ('Daijiaba', 'China', 'Opegraphaceae', null);
insert into Adres (Miejscowosc, Kraj, Planeta, `Kod pocztowy`) values ('Caofang', 'China', 'Brassicaceae', null);
insert into Adres (Miejscowosc, Kraj, Planeta, `Kod pocztowy`) values ('Taboc', 'Philippines', 'Polygonaceae', '9007');
insert into Adres (Miejscowosc, Kraj, Planeta, `Kod pocztowy`) values ('Concepcion', 'Philippines', 'Rhizocarpaceae', '7213');
insert into Adres (Miejscowosc, Kraj, Planeta, `Kod pocztowy`) values ('Zhangdun', 'China', 'Hymenophyllaceae', null);
insert into Adres (Miejscowosc, Kraj, Planeta, `Kod pocztowy`) values ('Bandar ‘Abbās', 'Iran', 'Brassicaceae', null);
insert into Adres (Miejscowosc, Kraj, Planeta, `Kod pocztowy`) values ('Vallentuna', 'Sweden', 'Poaceae', '186 96');
insert into Adres (Miejscowosc, Kraj, Planeta, `Kod pocztowy`) values ('Łobez', 'Poland', 'Caryophyllaceae', '73-150');
insert into Adres (Miejscowosc, Kraj, Planeta, `Kod pocztowy`) values ('Porsgrunn', 'Norway', 'Liliaceae', '3912');
insert into Adres (Miejscowosc, Kraj, Planeta, `Kod pocztowy`) values ('Hengjie', 'China', 'Monoblastiaceae', null);
insert into Adres (Miejscowosc, Kraj, Planeta, `Kod pocztowy`) values ('Tunguang', 'China', 'Caryophyllaceae', null);
insert into Adres (Miejscowosc, Kraj, Planeta, `Kod pocztowy`) values ('Tengah', 'Indonesia', 'Portulacaceae', null);
insert into Adres (Miejscowosc, Kraj, Planeta, `Kod pocztowy`) values ('Länsi-Turunmaa', 'Finland', 'Dryopteridaceae', '33450');
insert into Adres (Miejscowosc, Kraj, Planeta, `Kod pocztowy`) values ('Jamaica', 'United States', 'Lecanoraceae', '11407');

insert into Pracownik (Imie, Nazwisko, Wynagrodzenie, FK_Adres) values ('Falkner', 'Swapp', 5825, 4);
insert into Pracownik (Imie, Nazwisko, Wynagrodzenie, FK_Adres) values ('Alfy', 'Stode', 4120, 7);
insert into Pracownik (Imie, Nazwisko, Wynagrodzenie, FK_Adres) values ('Irwinn', 'Goodbody', 5697, 4);
insert into Pracownik (Imie, Nazwisko, Wynagrodzenie, FK_Adres) values ('Mari', 'Le feaver', 4522, 6);
insert into Pracownik (Imie, Nazwisko, Wynagrodzenie, FK_Adres) values ('Bartie', 'Bernardy', 4893, 9);
insert into Pracownik (Imie, Nazwisko, Wynagrodzenie, FK_Adres) values ('Kirbee', 'Nutkins', 8066, 6);
insert into Pracownik (Imie, Nazwisko, Wynagrodzenie, FK_Adres) values ('Tamra', 'Coniam', 5672, 1);
insert into Pracownik (Imie, Nazwisko, Wynagrodzenie, FK_Adres) values ('Florie', 'Lagne', 5284, 3);
insert into Pracownik (Imie, Nazwisko, Wynagrodzenie, FK_Adres) values ('Bevon', 'Rudolph', 6875, 5);
insert into Pracownik (Imie, Nazwisko, Wynagrodzenie, FK_Adres) values ('Kylie', 'Denyagin', 8461, 6);


insert into Klient (Imie, Nazwisko, Wartosc, FK_Adres) values ('Dedra', 'McKeag', 70, 3);
insert into Klient (Imie, Nazwisko, Wartosc, FK_Adres) values ('Sarge', 'Eliaz', 60, 10);
insert into Klient (Imie, Nazwisko, Wartosc, FK_Adres) values ('Pandora', 'Livzey', 10, 3);
insert into Klient (Imie, Nazwisko, Wartosc, FK_Adres) values ('Row', 'Local', 71, 3);
insert into Klient (Imie, Nazwisko, Wartosc, FK_Adres) values ('Clevey', 'Abelovitz', 30, 2);
insert into Klient (Imie, Nazwisko, Wartosc, FK_Adres) values ('Mirelle', 'Rendle', 92, 2);
insert into Klient (Imie, Nazwisko, Wartosc, FK_Adres) values ('Ansel', 'Ashpole', 55, 2);
insert into Klient (Imie, Nazwisko, Wartosc, FK_Adres) values ('Berrie', 'Cockerill', 95, 7);
insert into Klient (Imie, Nazwisko, Wartosc, FK_Adres) values ('Rhianon', 'Doole', 17, 9);
insert into Klient (Imie, Nazwisko, Wartosc, FK_Adres) values ('Darcey', 'Bartrap', 27, 5);

INSERT INTO maszyna (Nazwa, `Czas 1 uzycia`, `Koszt 1 uzycia`, CzySprawna) values ("garnek3", 15.0*60, 3.52, TRUE);
INSERT INTO maszyna (Nazwa, `Czas 1 uzycia`, `Koszt 1 uzycia`, CzySprawna) values ("garnek1", 15.0*60, 3.52, TRUE);
INSERT INTO maszyna (Nazwa, `Czas 1 uzycia`, `Koszt 1 uzycia`, CzySprawna) values ("garnek2", 15.0*60, 3.52, FALSE);
INSERT INTO maszyna (Nazwa, `Czas 1 uzycia`, `Koszt 1 uzycia`, CzySprawna) values ("nóż", 2*60, 2.25, TRUE);
INSERT INTO maszyna (Nazwa, `Czas 1 uzycia`, `Koszt 1 uzycia`, CzySprawna) values ("nóż2", 2*60, 2.13, FALSE);
INSERT INTO maszyna (Nazwa, `Czas 1 uzycia`, `Koszt 1 uzycia`, CzySprawna) values ("piekarnik", 60*60, 13, TRUE);
INSERT INTO maszyna (Nazwa, `Czas 1 uzycia`, `Koszt 1 uzycia`, CzySprawna) values ("kuchenka", 35*60, 10, TRUE);
INSERT INTO maszyna (Nazwa, `Czas 1 uzycia`, `Koszt 1 uzycia`, CzySprawna) values ("patelnia", 25*60, 7.54, TRUE);
INSERT INTO maszyna (Nazwa, `Czas 1 uzycia`, `Koszt 1 uzycia`, CzySprawna) values ("piekarnik2", 60*60, 30, TRUE);
INSERT INTO maszyna (Nazwa, `Czas 1 uzycia`, `Koszt 1 uzycia`, CzySprawna) values ("pila do drewna", 60*60, 80, TRUE);
INSERT INTO maszyna (Nazwa, `Czas 1 uzycia`, `Koszt 1 uzycia`, CzySprawna) values ("młotek", 60*60, 80, TRUE);


insert into pracownik_maszyna (FK_Pracownik, FK_Maszyna) values (9, 9);
insert into pracownik_maszyna (FK_Pracownik, FK_Maszyna) values (9, 10);
insert into pracownik_maszyna (FK_Pracownik, FK_Maszyna) values (3, 3);
insert into pracownik_maszyna (FK_Pracownik, FK_Maszyna) values (9, 7);
insert into pracownik_maszyna (FK_Pracownik, FK_Maszyna) values (4, 8);
insert into pracownik_maszyna (FK_Pracownik, FK_Maszyna) values (2, 6);
insert into pracownik_maszyna (FK_Pracownik, FK_Maszyna) values (7, 11);
insert into pracownik_maszyna (FK_Pracownik, FK_Maszyna) values (4, 2);
insert into pracownik_maszyna (FK_Pracownik, FK_Maszyna) values (2, 2);
insert into pracownik_maszyna (FK_Pracownik, FK_Maszyna) values (5, 1);
insert into pracownik_maszyna (FK_Pracownik, FK_Maszyna) values (1, 3);
insert into pracownik_maszyna (FK_Pracownik, FK_Maszyna) values (9, 3);
insert into pracownik_maszyna (FK_Pracownik, FK_Maszyna) values (5, 1);
insert into pracownik_maszyna (FK_Pracownik, FK_Maszyna) values (6, 1);
insert into pracownik_maszyna (FK_Pracownik, FK_Maszyna) values (6, 2);
insert into pracownik_maszyna (FK_Pracownik, FK_Maszyna) values (1, 11);
insert into pracownik_maszyna (FK_Pracownik, FK_Maszyna) values (7, 2);
insert into pracownik_maszyna (FK_Pracownik, FK_Maszyna) values (3, 6);
insert into pracownik_maszyna (FK_Pracownik, FK_Maszyna) values (4, 4);
insert into pracownik_maszyna (FK_Pracownik, FK_Maszyna) values (4, 4);
insert into pracownik_maszyna (FK_Pracownik, FK_Maszyna) values (7, 7);
insert into pracownik_maszyna (FK_Pracownik, FK_Maszyna) values (2, 1);
insert into pracownik_maszyna (FK_Pracownik, FK_Maszyna) values (8, 8);
insert into pracownik_maszyna (FK_Pracownik, FK_Maszyna) values (6, 6);
insert into pracownik_maszyna (FK_Pracownik, FK_Maszyna) values (5, 2);
insert into pracownik_maszyna (FK_Pracownik, FK_Maszyna) values (3, 10);
insert into pracownik_maszyna (FK_Pracownik, FK_Maszyna) values (4, 2);
insert into pracownik_maszyna (FK_Pracownik, FK_Maszyna) values (6, 7);
insert into pracownik_maszyna (FK_Pracownik, FK_Maszyna) values (2, 3);
insert into pracownik_maszyna (FK_Pracownik, FK_Maszyna) values (3, 2);

insert into budynek (Nazwa, `Max pojemnosc [kg]`, `Max klientow [szt]`, `Koszt utrzymania`) values ("Centralny", 350000, 350, 35000);
insert into budynek (Nazwa, `Max pojemnosc [kg]`, `Max klientow [szt]`, `Koszt utrzymania`) values ("Północny", 123.25, 3, 250);
insert into budynek (Nazwa, `Max pojemnosc [kg]`, `Max klientow [szt]`, `Koszt utrzymania`) values ("Północnowschodni", 758595, 450, 85000);
insert into budynek (Nazwa, `Max pojemnosc [kg]`, `Max klientow [szt]`, `Koszt utrzymania`) values ("Wschodni", 2564, 20, 4500);
insert into budynek (Nazwa, `Max pojemnosc [kg]`, `Max klientow [szt]`, `Koszt utrzymania`) values ("Południowowschodni", 77770, 77, 777);
insert into budynek (Nazwa, `Max pojemnosc [kg]`, `Max klientow [szt]`, `Koszt utrzymania`) values ("Południowy", 35000, 35, 2500);
insert into budynek (Nazwa, `Max pojemnosc [kg]`, `Max klientow [szt]`, `Koszt utrzymania`) values ("Południowozachodni", 35, 5, 3000);
insert into budynek (Nazwa, `Max pojemnosc [kg]`, `Max klientow [szt]`, `Koszt utrzymania`) values ("Zachodni", 350000, 350, 35);
insert into budynek (Nazwa, `Max pojemnosc [kg]`, `Max klientow [szt]`, `Koszt utrzymania`) values ("Północnozachodni", 250*250, 7*95, 54784);
insert into budynek (Nazwa, `Max pojemnosc [kg]`, `Max klientow [szt]`, `Koszt utrzymania`) values ("Tymczasowy", 150000, 0, 88500);


insert into dostawca (Nazwa, `Koszt dostawy`, `Marza na komponencie`, `Dzien tygodnia dosawy`) values ('Balearica pavonina', 908.99, 7.75, "PON");
insert into Dostawca (Nazwa, `Koszt dostawy`, `Marza na komponencie`, `Dzien tygodnia dosawy`) values ('Cacatua tenuirostris', 855.39, 3.31, "WT");
insert into Dostawca (Nazwa, `Koszt dostawy`, `Marza na komponencie`, `Dzien tygodnia dosawy`) values ('Pseudocheirus peregrinus', 1326.67, 5.97, "WT");
insert into Dostawca (Nazwa, `Koszt dostawy`, `Marza na komponencie`, `Dzien tygodnia dosawy`) values ('Larus dominicanus', 1021.67, 9.88, "PT");
insert into Dostawca (Nazwa, `Koszt dostawy`, `Marza na komponencie`, `Dzien tygodnia dosawy`) values ('Aonyx capensis', 1311.55, 1.29, "CZW");
insert into Dostawca (Nazwa, `Koszt dostawy`, `Marza na komponencie`, `Dzien tygodnia dosawy`) values ('Eumetopias jubatus', 1756.49, 13.87, "PON");
insert into Dostawca (Nazwa, `Koszt dostawy`, `Marza na komponencie`, `Dzien tygodnia dosawy`) values ('Cebus apella', 1363.96, 8.85, "SR");
insert into Dostawca (Nazwa, `Koszt dostawy`, `Marza na komponencie`, `Dzien tygodnia dosawy`) values ('Crocuta crocuta', 883.46, 2.3, "SR");
insert into Dostawca (Nazwa, `Koszt dostawy`, `Marza na komponencie`, `Dzien tygodnia dosawy`) values ('Theropithecus gelada', 2358.68, 0.13, "WT");
insert into Dostawca (Nazwa, `Koszt dostawy`, `Marza na komponencie`, `Dzien tygodnia dosawy`) values ('Tenrec ecaudatus', 1612.34, 14.46, "PON");

insert into komponenty(Nazwa, Cena, Waga, `Ilosc dostepna`, FK_Dostawca) values ("drewno", 25.25 , 1.23, 350, 3);
insert into komponenty(Nazwa, Cena, Waga, `Ilosc dostepna`, FK_Dostawca) values ("pomidor", 5.25 , 0.1, 100, 5);
insert into komponenty(Nazwa, Cena, Waga, `Ilosc dostepna`, FK_Dostawca) values ("jabłko", 25.25 , 1.23, 350, 3);
insert into komponenty(Nazwa, Cena, Waga, `Ilosc dostepna`, FK_Dostawca) values ("gruszka", 25.25 , 1.23, 350, 3);
insert into komponenty(Nazwa, Cena, Waga, `Ilosc dostepna`, FK_Dostawca) values ("ziemniak", 25.25 , 1.23, 350, 3);
insert into komponenty(Nazwa, Cena, Waga, `Ilosc dostepna`, FK_Dostawca) values ("gwózdz", 25.25 , 1.23, 350, 3);
insert into komponenty(Nazwa, Cena, Waga, `Ilosc dostepna`, FK_Dostawca) values ("śruba", 25.25 , 1.23, 350, 3);
insert into komponenty(Nazwa, Cena, Waga, `Ilosc dostepna`, FK_Dostawca) values ("ananas", 25.25 , 1.23, 350, 3);
insert into komponenty(Nazwa, Cena, Waga, `Ilosc dostepna`, FK_Dostawca) values ("kokos", 25.25 , 1.23, 350, 3);
insert into komponenty(Nazwa, Cena, Waga, `Ilosc dostepna`, FK_Dostawca) values ("truskawka", 25.25 , 1.23, 350, 3);


insert into Zamowienie(Nazwa, Cena, `Data realizacji`) values ("gotowany pomidor", 5.5, '2023-12-12');
insert into Zamowienie(Nazwa, Cena, `Data realizacji`) values ("gotowany pomidor z ziemniakiem", 15.5, '2023-12-19');
insert into Zamowienie(Nazwa, Cena, `Data realizacji`) values ("krzeslo", 45.59, '2024-02-02');
insert into Zamowienie(Nazwa, Cena, `Data realizacji`) values ("biurko drewniane z truskawka", 75.5, '2025-02-02');
insert into Zamowienie(Nazwa, Cena, `Data realizacji`) values ("kokosowa gruszka pieczona", 21.21, '2022-02-02');
insert into Zamowienie(Nazwa, Cena, `Data realizacji`) values ("smażony pomidor", 11.21, '2023-01-09');
insert into Zamowienie(Nazwa, Cena, `Data realizacji`) values ("pieczony pomidor", 21.21, '1999-12-12');
insert into Zamowienie(Nazwa, Cena, `Data realizacji`) values ("deska", 20, '2023-06-06');
insert into Zamowienie(Nazwa, Cena, `Data realizacji`) values ("deska z gwoździem", 25, '2024-06-06');
insert into Zamowienie(Nazwa, Cena, `Data realizacji`) values ("frytki", 20, '2023-09-09');

insert into Zamowienie_Komponenty (fk_zamowienie, fk_komponenty) values (1,2);
insert into Zamowienie_Komponenty (fk_zamowienie, fk_komponenty) values (2,2);
insert into Zamowienie_Komponenty (fk_zamowienie, fk_komponenty) values (2,5);
insert into Zamowienie_Komponenty (fk_zamowienie, fk_komponenty) values (3,1);
insert into Zamowienie_Komponenty (fk_zamowienie, fk_komponenty) values (3,6);
insert into Zamowienie_Komponenty (fk_zamowienie, fk_komponenty) values (4,1);
insert into Zamowienie_Komponenty (fk_zamowienie, fk_komponenty) values (4,1);
insert into Zamowienie_Komponenty (fk_zamowienie, fk_komponenty) values (4,10);
insert into Zamowienie_Komponenty (fk_zamowienie, fk_komponenty) values (5,4);
insert into Zamowienie_Komponenty (fk_zamowienie, fk_komponenty) values (5,9);


insert into Zamowienie_Maszyna (FK_Zamowienie, FK_Maszyna) values (1,1);
insert into Zamowienie_Maszyna (FK_Zamowienie, FK_Maszyna) values (1,7);
insert into Zamowienie_Maszyna (FK_Zamowienie, FK_Maszyna) values (2,1);
insert into Zamowienie_Maszyna (FK_Zamowienie, FK_Maszyna) values (2,7);
insert into Zamowienie_Maszyna (FK_Zamowienie, FK_Maszyna) values (3,10);
insert into Zamowienie_Maszyna (FK_Zamowienie, FK_Maszyna) values (3,11);
insert into Zamowienie_Maszyna (FK_Zamowienie, FK_Maszyna) values (4,10);
insert into Zamowienie_Maszyna (FK_Zamowienie, FK_Maszyna) values (4,11);
insert into Zamowienie_Maszyna (FK_Zamowienie, FK_Maszyna) values (5,2);
insert into Zamowienie_Maszyna (FK_Zamowienie, FK_Maszyna) values (5,6);
