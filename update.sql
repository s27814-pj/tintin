SET SQL_SAFE_UPDATES = 0;
UPDATE Adres SET `Kod pocztowy`="BRAK" WHERE `Kod pocztowy` IS NULL;
UPDATE Adres SET Kraj="Polska" WHERE ID =11;
UPDATE Pracownik SET Wynagrodzenie = Wynagrodzenie*2 WHERE Wynagrodzenie BETWEEN 4000 AND 5000;
UPDATE Pracownik Set Nazwisko="Stodo" WHERE Nazwisko LIKE 'Sto%';
UPDATE KLIENT SET FK_Adres=8 WHERE FK_Adres = 7;
UPDATE KLIENT SET Wartosc=Wartosc+5 WHERE FK_Adres BETWEEN 1 AND 5;
UPDATE Budynek SET `Max klientow [szt]` = `Max pojemnosc [kg]`/100 WHERE ID=3;
UPDATE Budynek SET `Koszt utrzymania` = `Max pojemnosc [kg]`*2 WHERE `Koszt utrzymania`<1000;
UPDATE Maszyna SET CzySprawna = FALSE WHERE ID=5;
UPDATE Maszyna SET `Czas 1 uzycia` = `Czas 1 uzycia`+2 WHERE `Czas 1 uzycia`<=3;


UPDATE Zamowienie SET Cena =10 WHERE ID=1;
UPDATE Zamowienie SET Cena = Cena*2 WHERE CENA <11;
UPDATE Komponenty 
SET FK_Dostawca = FLOOR(RAND() * (10 - 1) + 1) 
WHERE FK_dostawca = 3;

UPDATE Komponenty SET `Ilosc dostepna` = 250 WHERE ID=5;
UPDATE dostawca SET `Koszt dostawy` = 111 WHERE ID =1;
UPDATE dostawca SET `Koszt dostawy` = 254  WHERE ID BETWEEN 3 AND 5;


DELETE FROM Adres WHERE Planeta = "Caryophyllaceae";
DELETE FROM Adres WHERE ID > 1 AND ID <2;

DELETE FROM budynek WHERE `Koszt utrzymania`<1500;
DELETE FROM budynek WHERE ID=1;

DELETE FROM Dostawca WHERE `Marza na komponencie` >10;
set foreign_key_checks = 0;
DELETE FROM Dostawca WHERE `Dzien tygodnia dosawy` LIKE 'P%';


DELETE FROM klient WHERE Wartosc <20;
DELETE FROM klient WHERE ID=1;

DELETE FROM komponenty WHERE ID=8;
DELETE FROM komponenty WHERE ID>5 AND FK_Dostawca=2;

DELETE FROM pracownik WHERE ID=1;
DELETE FROM pracownik WHERE Nazwisko LIKE 'Sto%';

DELETE FROM zamowienie WHERE ID=1;
DELETE FROM zamowienie WHERE Cena <16 AND Cena > 12;

TRUNCATE pracownik_maszyna;


set foreign_key_checks = 1;
SET SQL_SAFE_UPDATES = 1;
