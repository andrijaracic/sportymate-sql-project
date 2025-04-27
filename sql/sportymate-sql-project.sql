IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'sportymate')
BEGIN
    CREATE DATABASE sportymate;
END



USE sportymate;

-- Pravi tabelu hale u kojoj se nalaze sve hale i njihove lokacije u kojima se odigravaju utakmice
CREATE TABLE hale (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    naziv NVARCHAR(200) NOT NULL,
    lokacija NVARCHAR(200) NOT NULL
);

-- INSERT INTO za tabelu hale
INSERT INTO hale (naziv, lokacija) VALUES
('SC "Šumice"', 'Ustanička 125A, Beograd (Voždovac)'),
('Hala "David Kalinić"', 'Stanka Vraza 44, Beograd'),
('Hala "Milan Gurović"', 'Kolumbova 8, Ledine Sur?in'),
('SC "Majdan"', 'Kozjačka 3-5, Beograd'),
('Corn Product Balon', 'Grčića Milenka 74, Beograd'),
('Balon Sava', 'Ljutice Bogdana 46, Beograd');

-- Pravi tabelu lige u kojoj se nalaze svi podatci o svim ligama i njihovi rangovi(nivo takmicenja)
CREATE TABLE lige (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    naziv NVARCHAR(100) NOT NULL,
    rang INT NOT NULL
);

-- INSERT INTO za tabelu lige
INSERT INTO lige (naziv, rang) VALUES
('PRO LIGA', 1),
('PREMIUM A LIGA', 2),
('PREMIUM B LIGA', 2),
('DIAMOND LIGA', 3),
('EAST LIGA', 4),
('WEST LIGA', 5),
('NORTH LIGA', 6),
('GOLD A LIGA', 7),
('GOLD B LIGA', 7),
('SOUTHEAST LIGA', 8),
('SOUTHWEST LIGA', 9),
('SOUTH A LIGA', 10),
('SOUTH B LIGA', 10),
('SOUTH C LIGA', 10);

-- Pravi tabelu timovi u kojoj se nalaze svi timovi i id-jevi liga u kojima igraju
CREATE TABLE timovi (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- Primarni ključ sa automatskim inkrementiranjem
    naziv NVARCHAR(100) NOT NULL,              -- Naziv tima, ne može biti NULL
    liga_id INT NOT NULL,                      -- Strani ključ koji referencira "lige.id"
    CONSTRAINT fk_timovi_lige FOREIGN KEY (liga_id) REFERENCES lige(id) ON DELETE CASCADE
);

-- INSERT INTO za tabelu timovi
INSERT INTO timovi (naziv, liga_id) VALUES
('Way Star',1),
('Rekreacija Stojke', 1),
('Akatsuki', 1),
('KK Zvezdara', 1),
('LIGHTHOUSE', 1),
('AST', 1),
('Supersmederevac', 1),
('Al Karam', 1), 
('Europe Basket Prep', 1),
('Loža', 1),
('Kokos Rolnice', 1),
('KK TIGROVI', 2),
('KK Aktiva Sistem', 2),
('Cenosilikofobi?ari', 2),
('AGM', 2),
('Frutti Senjakspor', 2),
('KK PANTER', 2),
('GG Bukva', 2),
('TRIPLE THREAT MALINIJARSI', 2),
('EASYLIFE', 2),
('The Ravens', 2),
('Wildcards Avangarda', 2),
('KK HEMAG', 2),
('URSI DOBANOVCI', 3),
('Blok Bucks', 3),
('Los Pollos Hermanos', 3),
('JAKE EGZIBICIJE', 3),
('Nikolas Wines', 3),
('ŠORKANOVI TIGROVI', 3),
('Usketašizabanje', 3),
('MODAMS', 3),
('Savini Veterani', 3),
('Los Komandos', 3),
('Gorštak', 4),
('Spartakus', 4),
('Bela Ruža', 4),
('KK Baroni', 4),
('Bahami', 4),
('?i?ko Pari?ko Karaburma', 4),
('Flying Dogz', 4),
('Airless', 4),
('RunTrace', 4),
('Dream Catchers', 4),
('Leva Obala Beograda Bor?a', 5),
('KC Korporacija', 5),
('Titani', 5),
('Fizio Dijars', 5),
('Monsters', 5),
('Pistacci', 5),
('BC Flaming Lions', 5),
('Kerovi', 5),
('Brigidi Bauns', 5),
('Skenzzy', 5);

-- Pravi tabelu igraci u kojoj se nalaze svi podatci o igracima ukljucujuci i id ekipe u kojoj igraju
CREATE TABLE igraci (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	broj_na_dresu INT NOT NULL,
    ime NVARCHAR(40) NOT NULL,
    prezime NVARCHAR(40) NOT NULL,
    tim_id INT NOT NULL FOREIGN KEY REFERENCES timovi(id)
);

SELECT * FROM igraci

-- INSERT INTO za tabelu igraci
INSERT INTO igraci (broj_na_dresu,ime, prezime, tim_id) VALUES (3,'Uroš', 'Kapor', 4);
INSERT INTO igraci (broj_na_dresu,ime, prezime, tim_id) VALUES (8,'Bogdan', 'Miljuš', 4);
INSERT INTO igraci (broj_na_dresu,ime, prezime, tim_id) VALUES (9,'Naser', 'Ajrizaj', 4);
INSERT INTO igraci (broj_na_dresu,ime, prezime, tim_id) VALUES (10,'Dejan', '?or?evi?', 4);
INSERT INTO igraci (broj_na_dresu,ime, prezime, tim_id) VALUES (14,'Lazar', 'Pavlovi?', 4);
INSERT INTO igraci (broj_na_dresu,ime, prezime, tim_id) VALUES (15,'Matija', 'Ilijevi?', 4);
INSERT INTO igraci (broj_na_dresu,ime, prezime, tim_id) VALUES (21,'Marko', 'Mi?unovi?', 4);
INSERT INTO igraci (broj_na_dresu,ime, prezime, tim_id) VALUES (34,'Mihailo', 'Škari?', 4);
INSERT INTO igraci (broj_na_dresu,ime, prezime, tim_id) VALUES (41,'Strahinja', 'Stamenkovi?', 4);

INSERT INTO igraci (broj_na_dresu,ime, prezime, tim_id) VALUES (1,'Luka', '?or?evi?', 1);
INSERT INTO igraci (broj_na_dresu,ime, prezime, tim_id) VALUES (3,'Stefan', 'Trajkovi?', 1);
INSERT INTO igraci (broj_na_dresu,ime, prezime, tim_id) VALUES (9,'Aleksandar', 'Tornjanski', 1);
INSERT INTO igraci (broj_na_dresu,ime, prezime, tim_id) VALUES (10,'Radoš', 'Ra?evi?', 1);
INSERT INTO igraci (broj_na_dresu,ime, prezime, tim_id) VALUES (11,'Aleksandar', 'Rosi?', 1);
INSERT INTO igraci (broj_na_dresu,ime, prezime, tim_id) VALUES (23,'Saša', '?erovac', 1);
INSERT INTO igraci (broj_na_dresu,ime, prezime, tim_id) VALUES (24,'Milan', 'Pavlovi?', 1);
INSERT INTO igraci (broj_na_dresu,ime, prezime, tim_id) VALUES (32,'Darko', 'Cvetkovi?', 1);
INSERT INTO igraci (broj_na_dresu,ime, prezime, tim_id) VALUES (34,'Dušan', 'Doli?', 1);

INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (0, 'Marko', 'Mili?', 3);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (00, 'Vuk', 'Kova?evi?', 3);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (1, 'Igor', 'Jakovljevi?', 3);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (6, 'Jari? Mane', 'Miloševi?', 3);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (8, 'Milan', 'Gosi?', 3);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (11, 'Dimitrije', 'Staji?', 3);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (30, 'Danilo', 'Denda', 3);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (44, 'Vladimir', 'Stojanovi?', 3);

INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (4, 'Vladimir', 'Obu?ina', 6);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (5, 'Vladimir', 'Nasti?', 6);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (9, 'Dušan', 'Mili?i?', 6);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (12, 'Vladimir', 'Sarajli?', 6);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (14, 'Nemanja', 'Radosavljevi?', 6);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (15, 'Nikola', 'Stojakovi?', 6);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (24, 'Aleksandar', 'Radenkovi?', 6);

INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (10, 'Marko', 'Jovanovi?', 34);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (12, 'Nikola', 'Petrovi?', 34);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (7, 'Luka', 'Ili?', 34);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (15, 'Aleksandar', 'Savi?', 34);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (8, 'Jovan', 'Stojanovi?', 34);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (11, 'Stefan', 'Miloševi?', 34);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (4, 'Milan', '?or?evi?', 34);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (14, 'Vladan', 'Kova?evi?', 34);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (6, 'Dušan', 'Nikoli?', 34);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (9, 'Saša', 'Pavlovi?', 34);

INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (23, 'Bogdan', 'Lazi?', 37);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (21, 'Igor', 'Markovi?', 37);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (20, 'Nemanja', 'Vasiljevi?', 37);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (24, 'Goran', 'Jankovi?', 37);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (22, 'Tomas', 'Miti?', 37);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (17, 'Rade', 'Marinkovi?', 37);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (16, 'Mihailo', 'Pavlovi?', 37);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (18, 'Jovan', 'Vukovi?', 37);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (25, 'Boško', 'Todorovi?', 37);
INSERT INTO igraci (broj_na_dresu, ime, prezime, tim_id) VALUES (19, 'Marko', 'Živanovi?', 37);


-- Pravi tabelu utakmice u kojoj se nalaze podatci o tome gde se igra,datum utakmice, koja je runda kao i kojoj ligi pripada utakmica
CREATE TABLE utakmice (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    hala_id INT NOT NULL FOREIGN KEY REFERENCES hale(id),
    datum_i_vreme DATETIME NOT NULL,
    runda INT NOT NULL,
    liga_id INT NOT NULL FOREIGN KEY REFERENCES lige(id)
);

-- INSERT INTO za tabelu utakmice
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (1, '2024-10-5 17:20:00',1,1);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (2, '2024-10-6 20:00:00',1,1);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (2, '2024-10-16 15:00:00',2,1);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (5, '2024-10-16 15:00:00',1,4);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (1, '2024-10-05 11:30:00', 1, 1);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (2, '2024-10-06 14:00:00', 2, 2);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (5, '2024-10-12 17:45:00', 3, 3);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (6, '2024-10-13 19:15:00', 4, 4);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (3, '2024-10-19 13:30:00', 5, 5);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (1, '2024-10-20 16:00:00', 6, 1);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (4, '2024-10-26 10:15:00', 7, 2);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (5, '2024-10-27 15:30:00', 8, 3);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (2, '2024-11-02 17:50:00', 9, 4);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (6, '2024-11-03 18:00:00', 10, 5);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (1, '2024-11-09 12:30:00', 11, 1);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (4, '2024-11-10 13:00:00', 12, 2);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (2, '2024-11-16 16:20:00', 1, 3);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (3, '2024-11-17 19:00:00', 2, 4);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (5, '2024-11-23 15:45:00', 3, 5);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (6, '2024-11-24 12:10:00', 4, 1);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (1, '2024-11-30 18:00:00', 5, 2);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (4, '2024-12-01 11:30:00', 6, 3);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (2, '2024-12-07 14:15:00', 7, 4);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (5, '2024-12-08 16:45:00', 8, 5);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (3, '2024-12-14 12:00:00', 9, 1);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (6, '2024-12-15 15:30:00', 10, 2);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (2, '2024-12-21 17:00:00', 11, 3);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (4, '2024-12-22 14:45:00', 12, 4);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (1, '2024-12-28 12:30:00', 1, 5);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (3, '2024-12-29 13:10:00', 2, 1);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (5, '2025-01-04 11:50:00', 3, 2);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (6, '2025-01-05 16:00:00', 4, 3);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (1, '2025-01-11 18:40:00', 5, 4);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (2, '2025-01-12 12:20:00', 6, 5);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (3, '2025-01-18 13:00:00', 7, 1);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (4, '2025-01-19 17:15:00', 8, 2);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (5, '2025-01-25 10:30:00', 9, 3);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (6, '2025-01-26 19:00:00', 10, 4);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (1, '2025-02-01 12:40:00', 11, 5);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (2, '2025-02-02 16:30:00', 12, 1);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (3, '2025-02-08 14:00:00', 1, 2);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (4, '2025-02-09 15:45:00', 2, 3);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (5, '2025-02-15 11:00:00', 3, 4);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (6, '2025-02-16 13:10:00', 4, 5);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (2, '2025-02-22 14:45:00', 5, 1);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (4, '2025-02-23 18:00:00', 6, 2);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (1, '2025-03-01 16:30:00', 7, 3);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (3, '2025-03-02 14:45:00', 8, 4);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (5, '2025-03-08 10:00:00', 9, 5);
INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id) VALUES (6, '2025-03-09 18:15:00', 10, 1);

-- Pravi tabelu utakmice_timovi u kojoj se nalaze podatci koje ekipe su ucestvovale na odredjenoj utakmici kao i ko je pobednik, 
-- moguce je da polje pobednik bude NULL u slucaju ako ta utakmice nije odigrana vec je samo zakazana
CREATE TABLE utakmice_timovi (
    utakmica_id INT NOT NULL,
    tim_id INT NOT NULL,
    pobednik INT,
    PRIMARY KEY (utakmica_id, tim_id),
    CONSTRAINT fk_utakmica FOREIGN KEY (utakmica_id) REFERENCES utakmice(id),
    CONSTRAINT fk_tim FOREIGN KEY (tim_id) REFERENCES timovi(id),
    CONSTRAINT chk_pobednik CHECK (pobednik IN (0, 1) OR pobednik IS NULL)
);

-- INSERT INTO za tabelu utakmice_timovi
-- Odigrane utakmice
INSERT INTO utakmice_timovi (utakmica_id,tim_id,pobednik) VALUES (1,1,1);
INSERT INTO utakmice_timovi (utakmica_id,tim_id,pobednik) VALUES (1,4,0);
INSERT INTO utakmice_timovi (utakmica_id,tim_id,pobednik) VALUES (2,3,1);
INSERT INTO utakmice_timovi (utakmica_id,tim_id,pobednik) VALUES (2,6,0);
INSERT INTO utakmice_timovi (utakmica_id,tim_id,pobednik) VALUES (3,1,1);
INSERT INTO utakmice_timovi (utakmica_id,tim_id,pobednik) VALUES (3,6,0);
INSERT INTO utakmice_timovi (utakmica_id,tim_id,pobednik) VALUES (4,34,1);
INSERT INTO utakmice_timovi (utakmica_id,tim_id,pobednik) VALUES (4,37,0);
-- Zakazane utakmice
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (5, 1, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (5, 8, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (6, 16, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (6, 22, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (7, 27, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (7, 31, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (8, 36, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (8, 40, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (9, 45, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (9, 52, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (10, 3, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (10, 9, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (11, 14, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (11, 18, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (12, 29, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (12, 32, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (13, 35, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (13, 39, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (14, 47, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (14, 53, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (15, 6, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (15, 10, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (16, 12, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (16, 23, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (17, 25, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (17, 33, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (18, 34, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (18, 38, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (19, 44, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (19, 51, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (20, 2, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (20, 7, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (21, 13, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (21, 20, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (22, 30, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (22, 28, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (23, 41, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (23, 37, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (24, 46, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (24, 49, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (25, 4, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (25, 11, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (26, 15, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (26, 19, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (27, 26, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (27, 32, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (28, 35, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (28, 40, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (29, 50, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (29, 52, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (30, 5, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (30, 9, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (31, 17, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (31, 22, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (32, 24, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (32, 30, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (33, 36, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (33, 39, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (34, 48, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (34, 53, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (35, 2, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (35, 10, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (36, 12, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (36, 20, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (37, 28, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (37, 33, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (38, 34, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (38, 43, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (39, 44, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (39, 51, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (40, 1, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (40, 7, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (41, 13, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (41, 21, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (42, 27, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (42, 31, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (43, 38, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (43, 40, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (44, 46, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (44, 53, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (45, 4, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (45, 11, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (46, 16, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (46, 19, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (47, 24, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (47, 26, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (48, 35, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (48, 42, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (49, 48, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (49, 50, NULL);

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (50, 3, NULL);
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik) VALUES (50, 5, NULL);


-- Pravi tabelu utakmice_igraci u njoj se nalazi pojedinacna statistika za svakog igraca za utakmicu po cetvrtinama,
-- Pomocu ove tabele se racunaju podatci koliko je koja ekipa postigla poena na utakmici
CREATE TABLE utakmice_igraci (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    igrac_id INT NOT NULL FOREIGN KEY REFERENCES igraci(id),
    utakmica_id INT NOT NULL FOREIGN KEY REFERENCES utakmice(id),
	cetvrtina INT NOT NULL,
    asistencije INT NOT NULL,
    ofanzivni_skokovi INT NOT NULL,
    defanzivni_skokovi INT NOT NULL,
    blokade INT NOT NULL,
    ukradene_lopte INT NOT NULL,
    faulovi INT NOT NULL,
	izgubljene_lopte INT NOT NULL,
    sutnuto_trojki INT NOT NULL,
    sutnuto_dvojki INT NOT NULL,
    sutnuto_slobodnih_bacanja INT NOT NULL,
    pogodjeno_trojki INT NOT NULL,
    pogodjeno_dvojki INT NOT NULL,
    pogodjeno_slobodnih_bacanja INT NOT NULL
);

-- INSERT INTO za tabelu utakmice_igraci
INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, sutnuto_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_trojki, pogodjeno_dvojki, pogodjeno_slobodnih_bacanja) 
VALUES 
(1, 1, 1, 1, 0, 1, 0, 0, 0, 1, 0, 2, 0, 0, 2, 0),
(2, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 1, 1, 0, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0),
(5, 1, 1, 0, 0, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0),
(6, 1, 1, 0, 0, 2, 0, 0, 1, 0, 0, 1, 2, 0, 1, 2),
(7, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 2, 1, 0, 2, 1),
(8, 1, 1, 0, 1, 2, 0, 0, 0, 0, 0, 3, 0, 0, 2, 0),
(9, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, sutnuto_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_trojki, pogodjeno_dvojki, pogodjeno_slobodnih_bacanja) 
VALUES 

(10, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0),
(11, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0),
(12, 1, 1, 0, 0, 2, 0, 0, 2, 0, 0, 1, 2, 0, 1, 2),
(13, 1, 1, 0, 0, 2, 0, 0, 2, 0, 0, 2, 2, 0, 2, 2),
(14, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0),
(15, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0),
(16, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 2, 0, 1, 2, 0),
(17, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 2, 1, 0, 2, 1),
(18, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 1);
INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, sutnuto_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_trojki, pogodjeno_dvojki, pogodjeno_slobodnih_bacanja) 
VALUES 

(1, 1, 2, 0, 0, 0, 0, 0, 0, 3, 4, 0, 0, 0, 0, 0),
(2, 1, 2, 1, 0, 2, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0),
(3, 1, 2, 0, 1, 1, 0, 2, 2, 0, 0, 1, 0, 0, 0, 0),
(4, 1, 2, 0, 0, 0, 0, 0, 1, 0, 2, 3, 1, 0, 2, 0),
(5, 1, 2, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 1, 0, 0),
(6, 1, 2, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0),
(7, 1, 2, 1, 0, 1, 0, 0, 0, 0, 1, 2, 1, 0, 2, 1),
(8, 1, 2, 1, 0, 1, 0, 0, 1, 1, 0, 2, 2, 0, 1, 2),
(9, 1, 2, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, sutnuto_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_trojki, pogodjeno_dvojki, pogodjeno_slobodnih_bacanja) 
VALUES 
(10, 1, 2, 1, 1, 1, 0, 1, 1, 0, 0, 2, 0, 0, 1, 0),
(11, 1, 2, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 1, 2, 0, 1, 1, 0, 1, 0, 1, 2, 1, 2, 0, 2, 1),
(13, 1, 2, 1, 0, 1, 0, 0, 1, 0, 0, 2, 2, 0, 2, 2),
(14, 1, 2, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1),
(15, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0),
(16, 1, 2, 1, 0, 0, 0, 0, 0, 0, 2, 1, 1, 1, 2, 1),
(17, 1, 2, 0, 1, 1, 0, 0, 1, 0, 0, 2, 0, 0, 0, 0),
(18, 1, 2, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, sutnuto_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_trojki, pogodjeno_dvojki, pogodjeno_slobodnih_bacanja) VALUES
(1, 1, 3, 1, 1, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1),
(2, 1, 3, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0),
(3, 1, 3, 1, 0, 1, 0, 0, 2, 0, 0, 1, 0, 0, 0, 0),
(4, 1, 3, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 1, 3, 1, 1, 3, 0, 1, 1, 0, 1, 2, 3, 1, 1, 2),
(6, 1, 3, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0),
(7, 1, 3, 0, 0, 0, 0, 0, 0, 0, 1, 3, 2, 1, 3, 2),
(8, 1, 3, 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 1, 2, 2),
(9, 1, 3, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, sutnuto_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_trojki, pogodjeno_dvojki, pogodjeno_slobodnih_bacanja) VALUES
(10, 1, 3, 1, 3, 1, 0, 1, 1, 2, 0, 3, 0, 0, 1, 1),
(11, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0),
(12, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0),
(13, 1, 3, 1, 0, 1, 0, 0, 1, 1, 2, 4, 0, 1, 2, 3),
(14, 1, 3, 0, 0, 1, 0, 0, 2, 0, 0, 1, 0, 0, 1, 1),
(15, 1, 3, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0),
(16, 1, 3, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1),
(17, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 1),
(18, 1, 3, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, sutnuto_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_trojki, pogodjeno_dvojki, pogodjeno_slobodnih_bacanja) VALUES
(1, 1, 4, 1, 0, 1, 0, 1, 1, 0, 0, 2, 0, 0, 0, 0),
(2, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0),
(3, 1, 4, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0),
(4, 1, 4, 1, 0, 1, 0, 0, 0, 1, 0, 2, 0, 1, 1, 0),
(5, 1, 4, 1, 1, 1, 0, 0, 0, 0, 1, 2, 2, 0, 2, 1),
(6, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0),
(7, 1, 4, 0, 2, 2, 0, 0, 1, 0, 1, 1, 2, 0, 1, 2),
(8, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 1, 4, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, sutnuto_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_trojki, pogodjeno_dvojki, pogodjeno_slobodnih_bacanja) VALUES
(10, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0),
(11, 1, 4, 0, 0, 0, 0, 2, 1, 1, 1, 1, 0, 1, 1, 0),
(12, 1, 4, 1, 1, 1, 0, 0, 0, 0, 0, 2, 1, 0, 1, 1),
(13, 1, 4, 0, 0, 1, 0, 0, 1, 1, 1, 3, 1, 0, 2, 1),
(14, 1, 4, 0, 0, 0, 0, 1, 0, 0, 0, 2, 1, 0, 2, 0),
(15, 1, 4, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0),
(16, 1, 4, 1, 1, 0, 0, 0, 2, 0, 0, 3, 1, 0, 1, 2),
(17, 1, 4, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1),
(18, 1, 4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, sutnuto_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_trojki, pogodjeno_dvojki, pogodjeno_slobodnih_bacanja) VALUES

(19, 2, 1, 1, 0, 2, 0, 1, 2, 1, 1, 2, 0, 0, 1, 0),
(19, 2, 2, 2, 1, 1, 0, 0, 1, 0, 1, 1, 2, 1, 1, 1),
(19, 2, 3, 0, 0, 1, 1, 1, 0, 1, 2, 1, 1, 1, 0, 1),
(19, 2, 4, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0),

(20, 2, 1, 0, 1, 1, 1, 0, 1, 1, 0, 2, 2, 0, 1, 1),
(20, 2, 2, 2, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0),
(20, 2, 3, 1, 1, 2, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0),
(20, 2, 4, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 1),

(21, 2, 1, 1, 1, 0, 0, 1, 1, 2, 2, 3, 2, 1, 1, 2),
(21, 2, 2, 3, 0, 2, 0, 2, 0, 1, 2, 2, 1, 1, 2, 1),
(21, 2, 3, 2, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1),
(21, 2, 4, 0, 1, 0, 1, 1, 0, 2, 2, 1, 1, 2, 1, 0),

(22, 2, 1, 1, 0, 1, 0, 0, 0, 1, 2, 1, 1, 1, 0, 1),
(22, 2, 2, 1, 1, 0, 0, 1, 1, 1, 1, 2, 1, 0, 2, 0),
(22, 2, 3, 0, 0, 1, 0, 1, 0, 0, 2, 1, 1, 1, 1, 1),
(22, 2, 4, 2, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1),

(23, 2, 1, 0, 1, 2, 0, 1, 1, 2, 1, 2, 0, 2, 1, 1),
(23, 2, 2, 1, 0, 1, 0, 0, 1, 1, 1, 2, 0, 1, 1, 0),
(23, 2, 3, 2, 1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1),
(23, 2, 4, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 1, 0),

(24, 2, 1, 1, 0, 2, 0, 0, 1, 0, 2, 2, 1, 2, 1, 1),
(24, 2, 2, 2, 1, 1, 0, 1, 1, 1, 1, 2, 1, 1, 1, 0),
(24, 2, 3, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1),
(24, 2, 4, 1, 1, 1, 0, 0, 0, 1, 2, 1, 0, 2, 0, 0),

(25, 2, 1, 0, 1, 1, 1, 0, 0, 1, 1, 2, 0, 1, 1, 0),
(25, 2, 2, 1, 0, 2, 0, 1, 0, 0, 2, 2, 1, 1, 1, 1),
(25, 2, 3, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0),
(25, 2, 4, 2, 1, 1, 1, 1, 1, 2, 2, 1, 1, 0, 2, 0),

(26, 2, 1, 2, 0, 1, 0, 1, 0, 1, 1, 2, 1, 2, 0, 1),
(26, 2, 2, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0),
(26, 2, 3, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1),
(26, 2, 4, 1, 1, 1, 1, 0, 0, 1, 2, 0, 0, 1, 0, 0);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, sutnuto_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_trojki, pogodjeno_dvojki, pogodjeno_slobodnih_bacanja) VALUES

(27, 2, 1, 1, 0, 1, 0, 0, 1, 0, 1, 2, 1, 0, 1, 0),
(27, 2, 2, 2, 0, 1, 0, 0, 0, 1, 1, 1, 2, 1, 1, 1),
(27, 2, 3, 0, 0, 2, 0, 1, 0, 2, 1, 1, 1, 1, 0, 1),
(27, 2, 4, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1),

(28, 2, 1, 0, 1, 2, 0, 0, 1, 1, 0, 2, 0, 0, 1, 1),
(28, 2, 2, 2, 0, 1, 0, 1, 0, 0, 1, 2, 1, 1, 1, 0),
(28, 2, 3, 0, 0, 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1),
(28, 2, 4, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0),

(29, 2, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0),
(29, 2, 2, 2, 1, 1, 0, 0, 1, 0, 1, 2, 0, 0, 2, 0),
(29, 2, 3, 1, 0, 0, 0, 1, 0, 0, 2, 1, 1, 1, 1, 1),
(29, 2, 4, 0, 0, 2, 1, 1, 1, 1, 0, 1, 0, 1, 1, 0),

(30, 2, 1, 1, 0, 1, 1, 0, 1, 1, 2, 1, 0, 1, 1, 1),
(30, 2, 2, 2, 1, 1, 1, 1, 0, 1, 1, 1, 2, 1, 0, 2),
(30, 2, 3, 1, 0, 0, 1, 0, 1, 1, 0, 2, 0, 1, 1, 0),
(30, 2, 4, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0),

(31, 2, 1, 0, 1, 2, 0, 0, 1, 1, 1, 2, 1, 0, 1, 1),
(31, 2, 2, 1, 0, 1, 0, 1, 0, 1, 2, 1, 1, 1, 1, 1),
(31, 2, 3, 2, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0),
(31, 2, 4, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1),

(32, 2, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0),
(32, 2, 2, 2, 1, 0, 0, 1, 0, 1, 1, 1, 2, 1, 1, 0),
(32, 2, 3, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 1),
(32, 2, 4, 1, 1, 1, 1, 0, 0, 1, 2, 1, 0, 2, 1, 1),

(33, 2, 1, 1, 0, 1, 0, 0, 1, 0, 1, 2, 1, 1, 0, 1),
(33, 2, 2, 2, 1, 0, 0, 1, 0, 1, 1, 1, 2, 1, 0, 1),
(33, 2, 3, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 1, 0),
(33, 2, 4, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 1);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(10, 3, 1, 2, 1, 2, 1, 1, 1, 0, 2, 1, 3, 2, 1, 1),
(10, 3, 2, 1, 0, 1, 0, 1, 1, 1, 1, 1, 2, 1, 1, 1),
(10, 3, 3, 1, 1, 1, 0, 1, 0, 1, 2, 1, 1, 0, 2, 2),
(10, 3, 4, 1, 1, 0, 1, 0, 0, 0, 1, 1, 2, 1, 0, 0);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(11, 3, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0),
(11, 3, 2, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0),
(11, 3, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0),
(11, 3, 4, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(12, 3, 1, 1, 1, 2, 1, 1, 1, 0, 2, 1, 2, 2, 2, 2),
(12, 3, 2, 1, 0, 1, 1, 1, 0, 1, 1, 1, 2, 1, 1, 1),
(12, 3, 3, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0),
(12, 3, 4, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 1, 1);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(13, 3, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0),
(13, 3, 2, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0),
(13, 3, 3, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
(13, 3, 4, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(14, 3, 1, 2, 1, 1, 0, 1, 1, 0, 1, 1, 2, 2, 0, 0),
(14, 3, 2, 0, 1, 1, 1, 0, 1, 0, 2, 1, 1, 1, 1, 1),
(14, 3, 3, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 2, 1),
(14, 3, 4, 1, 1, 1, 0, 1, 1, 0, 2, 1, 1, 0, 1, 1);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(15, 3, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 2, 1, 1, 0),
(15, 3, 2, 1, 1, 1, 0, 1, 1, 0, 2, 1, 1, 1, 1, 1),
(15, 3, 3, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0),
(15, 3, 4, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(16, 3, 1, 0, 1, 1, 0, 1, 1, 1, 2, 1, 0, 0, 1, 1),
(16, 3, 2, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1),
(16, 3, 3, 1, 0, 1, 1, 1, 1, 0, 2, 1, 0, 0, 1, 0),
(16, 3, 4, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(17, 3, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0),
(17, 3, 2, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0),
(17, 3, 3, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0),
(17, 3, 4, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(18, 3, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0),
(18, 3, 2, 1, 1, 1, 0, 1, 0, 1, 2, 1, 0, 0, 1, 1),
(18, 3, 3, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0),
(18, 3, 4, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(27, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(27, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(27, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(27, 3, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(28, 3, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0),
(28, 3, 2, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0),
(28, 3, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(28, 3, 4, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(29, 3, 1, 1, 0, 1, 1, 1, 0, 1, 2, 1, 1, 1, 1, 1),
(29, 3, 2, 1, 1, 1, 1, 0, 1, 0, 1, 1, 2, 1, 1, 0),
(29, 3, 3, 1, 1, 0, 1, 1, 1, 1, 1, 1, 2, 1, 0, 1),
(29, 3, 4, 0, 1, 1, 0, 1, 0, 0, 2, 2, 1, 1, 1, 0);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(30, 3, 1, 1, 1, 1, 0, 1, 1, 0, 2, 1, 1, 1, 1, 1),
(30, 3, 2, 1, 1, 0, 0, 1, 0, 0, 1, 1, 2, 1, 1, 1),
(30, 3, 3, 1, 0, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1, 1),
(30, 3, 4, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(31, 3, 1, 1, 1, 1, 0, 1, 1, 1, 2, 1, 2, 1, 2, 2),
(31, 3, 2, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1),
(31, 3, 3, 1, 1, 1, 0, 0, 1, 1, 2, 1, 1, 0, 1, 1),
(31, 3, 4, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(32, 3, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1),
(32, 3, 2, 1, 0, 1, 1, 1, 1, 0, 1, 1, 2, 1, 1, 0),
(32, 3, 3, 1, 1, 0, 1, 1, 1, 0, 2, 1, 1, 1, 1, 1),
(32, 3, 4, 1, 1, 1, 0, 1, 0, 1, 1, 0, 2, 1, 1, 0);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(33, 3, 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0),
(33, 3, 2, 1, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 2, 0),
(33, 3, 3, 1, 1, 1, 0, 1, 1, 0, 2, 1, 0, 0, 2, 0),
(33, 3, 4, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(34, 4, 1, 2, 1, 2, 1, 0, 1, 0, 0, 0, 3, 2, 1, 1),
(34, 4, 2, 1, 0, 1, 0, 0, 1, 1, 0, 0, 2, 1, 1, 1),
(34, 4, 3, 0, 1, 1, 0, 0, 0, 1, 2, 0, 1, 0, 2, 2),
(34, 4, 4, 0, 1, 0, 1, 0, 0, 0, 1, 1, 2, 1, 0, 0);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(35, 4, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0),
(35, 4, 2, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 0),
(35, 4, 3, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0),
(35, 4, 4, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(36, 4, 1, 1, 1, 2, 1, 1, 1, 0, 2, 0, 2, 2, 2, 2),
(36, 4, 2, 1, 0, 1, 1, 1, 0, 1, 1, 0, 2, 1, 1, 1),
(36, 4, 3, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1, 1, 0, 0),
(36, 4, 4, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 1, 1);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(37, 4, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0),
(37, 4, 2, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0),
(37, 4, 3, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
(37, 4, 4, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(38, 4, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0),
(38, 4, 2, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0),
(38, 4, 3, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
(38, 4, 4, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(39, 4, 1, 1, 1, 2, 1, 1, 1, 0, 2, 0, 2, 0, 2, 2),
(39, 4, 2, 1, 0, 1, 1, 1, 0, 1, 1, 0, 2, 0, 1, 1),
(39, 4, 3, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0),
(39, 4, 4, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 1, 1);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(39, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(39, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(39, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(39, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(40, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(40, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(40, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(40, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(41, 4, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0),
(41, 4, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(41, 4, 3, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(41, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);



INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(44, 4, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0),
(44, 4, 2, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0),
(44, 4, 3, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
(44, 4, 4, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(45, 4, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0),
(45, 4, 2, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0),
(45, 4, 3, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0),
(45, 4, 4, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(46, 4, 1, 1, 1, 2, 1, 1, 1, 0, 2, 0, 2, 0, 2, 2),
(46, 4, 2, 1, 0, 1, 1, 1, 0, 1, 1, 0, 2, 0, 1, 1),
(46, 4, 3, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0),
(46, 4, 4, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 1, 1);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, sutnuto_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_trojki, pogodjeno_dvojki, pogodjeno_slobodnih_bacanja) VALUES

(47, 4, 1, 1, 0, 2, 0, 1, 2, 1, 1, 2, 0, 0, 1, 0),
(47, 4, 2, 2, 1, 1, 0, 0, 1, 0, 1, 1, 2, 1, 1, 1),
(47, 4, 3, 0, 0, 1, 1, 1, 0, 1, 2, 1, 1, 1, 0, 1),
(47, 4, 4, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(48, 4, 1, 1, 1, 2, 1, 1, 1, 0, 2, 0, 2, 0, 2, 2),
(48, 4, 2, 1, 0, 1, 1, 1, 0, 1, 1, 0, 2, 0, 1, 1),
(48, 4, 3, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0),
(48, 4, 4, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 1, 1);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(49, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(49, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(49, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(49, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

INSERT INTO utakmice_igraci (igrac_id, utakmica_id, cetvrtina, asistencije, ofanzivni_skokovi, defanzivni_skokovi, blokade, ukradene_lopte, faulovi, izgubljene_lopte, sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, pogodjeno_dvojki, sutnuto_slobodnih_bacanja, pogodjeno_slobodnih_bacanja)
VALUES 
(50, 4, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0),
(50, 4, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(50, 4, 3, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(50, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Pravi tabelu fantasy_korisnici u kojoj se nalaze podatci o svim ucesnicima Fantasy igre
CREATE TABLE fantasy_korisnici (
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	korisnicko_ime NVARCHAR(40) NOT NULL,
	sifra NVARCHAR(40) NOT NULL
);

-- INSERT INTO za tabelu fantasy_korisnici
INSERT INTO fantasy_korisnici (korisnicko_ime, sifra) VALUES  
('ppetrovic580', 'a2L3NTtDUJ'),
('jkovacevic261', 'CkGEmMz3rq'),
('sstojanovic438', 'C4rfDbiTUy'),
('milic787', 'ZEpD953ssF'),
('dilic209', '6XEurTSQzl'),
('ajovanovic932', 'SiGeZPBbFL'),
('speric678', 'f8KdY5LPZ1'),
('mjovanovic843', 'vkEz5SaDcm'),
('ndjordjevic169', 'N3SbUhWtEZ'),
('npopovic602', 'fjKPcT4HEi'),
('idjordjevic509', 'ahTdWcv9Uj'),
('ajovanovic110', 'pZ6jK5AVcQ'),
('pperic161', 'WpmhKAs7ic'),
('snikolic845', '1MAh6Gmb8i'),
('djovanovic723', 'iGMzL5VEfA'),
('istefanovic328', 'pLmHY1KFVx'),
('peric593', 'TrVnZj92pE'),
('ipetrovic705', 'uFWJgBTH83'),
('asavic460', '2MB7tNcDwF'),
('mjovanovic909', 'Wq8L9RtFIC'),
('nikolic387', 'ADkL4fq3Me'),
('ijovanovic695', 'mY7NtqXzL6'),
('smitrovic763', 'gHQSkzt13U'),
('apetrovic883', 'pK4VdxYCuT'),
('nikolic634', 'xM2SYvhVLe'),
('dsavic102', 'y7Qm8GRnJw'),
('jperic243', 'Fnz8Ge32Qr'),
('djovanovic505', 'Ls3hTq5NiE'),
('astefanovic826', 'Rw5TfGVbLY'),
('dnikolic288', 'Eh8XgZ63Kk'),
('pmilos654', 'yTBv7GRnLe'),
('istefanovic947', 'X3fWzQ4RbE'),
('asavic217', 'cTp8UzN3vH'),
('npopovic374', 'wSJ5Dc7RAu'),
('djovanovic711', 'GmQ8ZEkTxL'),
('mmitrovic527', 'vTfG3EBXy2'),
('istefanovic956', 'Zc7NtQ8LUw'),
('ppopovic432', 'bFt6P9JeVW'),
('mmitrovic297', 'DcT5HY6LxU'),
('iljiljana109', 'Rj4XKvYLPq'),
('ikovacevic455', 'pGrT9HQd2E'),
('dnikolic671', 'eG7KvNp3SZ'),
('asavic230', 'nF9TcB4MpX'),
('jkovacevic889', 'Kc8YP6NZeF'),
('nmilos719', 'Yq3LFt5BGe'),
('akrstic306', 'QvL6tHB3Pc'),
('dmitrovic411', 'GrH8XzNKtV'),
('pmitrovic290', 'tN4Zkq3WPu'),
('jmilos564', 'PrH7yZLfQB'),
('mmijatovic98' , '12Sasda21');

-- Pravi tabelu fantasy_timovi gde se nalaze podatci koje su igrace izabrali korisnici u svoju ekipu, moguce je da neko od korisnika ima napravljen nalog , a da nije izabrao jos svoju ekipu
CREATE TABLE fantasy_timovi (
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	korisnik_id INT NOT NULL FOREIGN KEY REFERENCES fantasy_korisnici(id),
	izabrani_igrac_id INT NOT NULL FOREIGN KEY REFERENCES igraci(id)
);

-- INSERT INTO za tabelu fantasy_timovi
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (1, 3);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (1, 7);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (1, 21);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (1, 34);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (1, 44);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (2, 5);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (2, 26);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (2, 32);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (2, 31);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (2, 7);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (3, 7);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (3, 14);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (3, 19);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (3, 36);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (3, 32);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (4, 7);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (4, 18);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (4, 27);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (4, 29);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (4, 52);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (5, 9);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (5, 21);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (5, 35);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (5, 43);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (5, 53);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (6, 4);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (6, 13);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (6, 24);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (6, 40);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (6, 48);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (7, 6);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (7, 11);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (7, 28);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (7, 7);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (7, 47);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (8, 1);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (8, 17);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (8, 26);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (8, 21);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (8, 49);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (9, 3);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (9, 15);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (9, 7);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (9, 21);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (9, 46);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (10, 5);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (10, 21);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (10, 34);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (10, 32);
INSERT INTO fantasy_timovi (korisnik_id, izabrani_igrac_id) VALUES (10, 51);

-- Pravi tabelu vesti u kojoj se nalaze vesti vezane za svaku odigranu utakmicu, ona ne sadrzi polje autor iz razloga sto na originalnom sajtu ne postoje autori vec su sve vesti generisane od strane AI
CREATE TABLE vesti (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    naslov NVARCHAR(255) NOT NULL,
    tekst NVARCHAR(MAX) NOT NULL,
    datum_i_vreme DATETIME NOT NULL,
    utakmica_id INT NULL FOREIGN KEY REFERENCES utakmice(id)
);

-- INSERT INTO za tabelu vesti
INSERT INTO vesti (naslov,tekst,datum_i_vreme,utakmica_id) VALUES 
('Way Star nadigrao KK Zvezdaru u sjajnoj utakmici rezultatom 104:89', 
'Ekipa Way Star-a odnela je ubedljivu pobedu protiv KK Zvezdara rezultatom 104:89 u uzbudljivoj utakmici punoj akcije. Od samog po?etka Way Star je kontrolisao igru, 
pokazavši odli?nu koheziju i napada?ku efikasnost. KK Zvezdara je pružila dobar otpor,
ali nije uspela da sustigne protivnika. Ovom pobedom, Way Star je u?vrstio svoju poziciju u ligi, dok Zvezdara ostaje sa izazovom da se oporavi u narednim me?evima.',
'2024-10-05 20:00:00.000',
1
)
INSERT INTO vesti (naslov,tekst,datum_i_vreme,utakmica_id) VALUES 
('Akatsuki briljirao u ofanzivnom spektaklu protiv AST-a sa rezultatom 154:124', 
'U neverovatno dinami?noj utakmici, ekipa Akatsuki je pobedila AST rezultatom 154:124. Obe ekipe su pokazale sjajnu napada?ku igru, ali Akatsuki je dominirao tokom celog me?a, 
ostvarivši ?ak 154 poena. AST je pružio solidan otpor, ali nije mogao da isprati visok tempo i efikasnost protivnika. Ovom pobedom, Akatsuki je pokazao zašto važi za jednog od 
favorita u ligi, dok AST mora da se fokusira na popravljanje svoje igre u narednim susretima..',
'2024-10-07 12:00:00.000',
2
)
INSERT INTO vesti (naslov,tekst,datum_i_vreme,utakmica_id) VALUES 
('Way Star ubedljivo savladao AST rezultatom 132:91', 
'Ekipa Way Star-a ostvarila je impresivnu pobedu nad AST-om rezultatom 132:91. Way Star je dominirao tokom ?itavog me?a, pokazuju?i izuzetnu napada?ku efikasnost i ?vrstu odbranu. 
AST je pokušao da se vrati u igru, ali je Way Star kontrolisao tempo i bez ve?ih poteško?a zabeležio ubedljivu pobedu. Ova pobeda dodatno u?vrš?uje Way Star na vrhu tabele, 
dok AST mora da traži šansu za povratak u narednim utakmicama.',
'2024-10-16 20:00:00.000',
3
)
INSERT INTO vesti (naslov,tekst,datum_i_vreme,utakmica_id) VALUES 
('Gorštak u neizvesnoj završnici pobedio KK Barone rezultatom 56:52', 
'Ekipa Gorštaka ostvarila je tesnu pobedu nad KK Baroni rezultatom 56:52. Utakmica je bila izuzetno napeta, sa obe ekipe koje su se smenjivale u vo?stvu tokom ?itavog me?a. 
Ipak, Gorštak je u poslednjim minutima uspeo da zadrži hladnokrvnost i osigura pobedu. KK Baroni je imao priliku da preokrene, ali su odlu?uju?i poeni Gorštaka doneli trijumf. 
Ova pobeda dodatno podiže moral ekipi Gorštaka u borbi za što bolji plasman na tabeli.',
'2024-10-16 17:30:00.000',
4
)

-- UPITI

-- Prikazuje pojedina?nu statistiku za svakog igra?a za izabranu utakmicu, u ovom slu?aju za utakmicu sa id-jem 1
SELECT
	-- prikazuje imena jedne i druge ekipe koje su u?estvovale na utakmici
    CONCAT(
        (SELECT timovi.naziv FROM timovi WHERE timovi.id = ekipa_pobednik.tim_id), 
        ' vs ',
        (SELECT timovi.naziv FROM timovi WHERE timovi.id = ekipa_porazeni.tim_id)
    ) AS utakmica,
    timovi.naziv as naziv_ekipe,
    CONCAT(igraci.ime, ' ', igraci.prezime) AS ime_prezime,
	-- Sumira sve poene igra?a pomo?u tabela pogodjeno_trojki,pogodjeno_dvojki i pogodjeno_slobodnih_bacanja
    SUM(pogodjeno_trojki * 3 + pogodjeno_dvojki * 2 + pogodjeno_slobodnih_bacanja) AS poeni,
    SUM(asistencije) AS ukupno_asistencija,
	SUM(ofanzivni_skokovi) AS ukupno_ofanzivni_skokovi,
	SUM(defanzivni_skokovi) AS ukupno_defanzivni_skokovi,
    SUM(ofanzivni_skokovi + defanzivni_skokovi) AS ukupno_skokova,
    SUM(blokade) AS ukupno_blokada,
    SUM(ukradene_lopte) AS ukupno_ukradenih_lopti,
    SUM(faulovi) AS ukupno_faulova,
    SUM(izgubljene_lopte) AS ukupno_izgubljenih_lopti,
	-- Prikazuju odnose šutnutih i pogodjenih koševa
    CONCAT(SUM(sutnuto_trojki), '/', SUM(pogodjeno_trojki)) AS trojke,
    CONCAT(SUM(sutnuto_dvojki), '/', SUM(pogodjeno_dvojki)) AS dvojke,
    CONCAT(SUM(sutnuto_slobodnih_bacanja), '/', SUM(pogodjeno_slobodnih_bacanja)) AS slobodna_bacanja,
	-- Sabira se ukupan indeks korisnosti tako što se od zbira ukupnih poena,asistencija,skokova,ukradenih lopti, blokada oduzima broj promašaja i broj izgubljenih lopti
    (SUM(pogodjeno_trojki * 3 + pogodjeno_dvojki * 2 + pogodjeno_slobodnih_bacanja) 
    + SUM(asistencije) 
    + SUM(ofanzivni_skokovi + defanzivni_skokovi) 
    + SUM(ukradene_lopte) 
    + SUM(blokade) 
    - (SUM(sutnuto_trojki) - SUM(pogodjeno_trojki) 
       + SUM(sutnuto_dvojki) - SUM(pogodjeno_dvojki) 
       + SUM(sutnuto_slobodnih_bacanja) - SUM(pogodjeno_slobodnih_bacanja)) 
    - SUM(izgubljene_lopte)) AS indeks_korisnosti
FROM utakmice_igraci
JOIN igraci ON utakmice_igraci.igrac_id = igraci.id
JOIN utakmice ON utakmice_igraci.utakmica_id = utakmice.id
JOIN timovi ON igraci.tim_id = timovi.id
-- Pridružujem obe ekipe pojedina?no ekipa_pobednik je pobednik , a ekipa_porazeni je poraženi
JOIN utakmice_timovi ekipa_pobednik ON utakmice.id = ekipa_pobednik.utakmica_id AND ekipa_pobednik.pobednik = 1
JOIN utakmice_timovi ekipa_porazeni ON utakmice.id = ekipa_porazeni.utakmica_id AND ekipa_porazeni.pobednik = 0
WHERE utakmice.id = 1
GROUP BY igraci.ime, igraci.prezime, timovi.naziv, ekipa_pobednik.tim_id, ekipa_porazeni.tim_id
ORDER BY poeni DESC;

-- Prikazuje prose?nu statistiku za 10 najboljih igra?a u ligi po izboru
SELECT 
    CONCAT(igraci.ime, ' ', igraci.prezime) AS ime_prezime,
    timovi.naziv as naziv_ekipe,
	-- Sabira se prosečan indeks korisnosti tako što se od zbira ukupnih poena,asistencija,skokova,ukradenih lopti, blokada oduzima broj promašaja i broj izgubljenih lopti i na kraju se deli sa brojem odigranih utakmica igrača
	-- Na kraju se podatak predstavlja kao float
    CAST(
        (
            SUM(pogodjeno_trojki * 3 + pogodjeno_dvojki * 2 + pogodjeno_slobodnih_bacanja) 
            + SUM(asistencije) 
            + SUM(ofanzivni_skokovi + defanzivni_skokovi) 
            + SUM(ukradene_lopte) 
            + SUM(blokade) 
            - (SUM(sutnuto_trojki) - SUM(pogodjeno_trojki) 
               + SUM(sutnuto_dvojki) - SUM(pogodjeno_dvojki) 
               + SUM(sutnuto_slobodnih_bacanja) - SUM(pogodjeno_slobodnih_bacanja)) 
            - SUM(izgubljene_lopte)
        ) AS FLOAT
    ) / COUNT(DISTINCT utakmice.id) AS prosek_indeks_korisnosti,

    -- Prose?no poeni, računaju se tako što se ukupan broj poena deli sa brojem odigranih utakmica, takođe se predstavlja kao float
    CAST(
        SUM(pogodjeno_trojki * 3 + pogodjeno_dvojki * 2 + pogodjeno_slobodnih_bacanja) 
        AS FLOAT
    ) / COUNT(DISTINCT utakmice.id) AS prosek_poena,

    -- Prose?no asistencija
    CAST(SUM(asistencije) AS FLOAT) / COUNT(DISTINCT utakmice.id) AS prosek_asistencija,
    
    -- Prose?no skokovi
    CAST(SUM(ofanzivni_skokovi + defanzivni_skokovi) AS FLOAT) / COUNT(DISTINCT utakmice.id) AS prosek_skokova,
    
    -- Prose?no blokade
    CAST(SUM(blokade) AS FLOAT) / COUNT(DISTINCT utakmice.id) AS prosek_blokada,

    -- Prose?no ukradene lopte
    CAST(SUM(ukradene_lopte) AS FLOAT) / COUNT(DISTINCT utakmice.id) AS prosek_ukradenih_lopti,

    -- Prose?no faulovi
    CAST(SUM(faulovi) AS FLOAT) / COUNT(DISTINCT utakmice.id) AS prosek_faulova,

    -- Prose?no izgubljene lopte
    CAST(SUM(izgubljene_lopte) AS FLOAT) / COUNT(DISTINCT utakmice.id) AS prosek_izgubljenih_lopti


FROM utakmice_igraci
JOIN igraci ON utakmice_igraci.igrac_id = igraci.id
JOIN utakmice ON utakmice_igraci.utakmica_id = utakmice.id
JOIN timovi ON igraci.tim_id = timovi.id
WHERE timovi.liga_id = 1
GROUP BY igrac_id, timovi.naziv, igraci.ime, igraci.prezime
ORDER BY 3 desc
-- Ograničava na 10 igrača sa najvecim indeksom korisnosti
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

-- Prikazuje koliko je svaki igrač ostvario bodova u dosadašnjem toku takmičenja
SELECT 
    fantasy_korisnici.korisnicko_ime,
    SUM(
        utakmice_igraci.asistencije +
        utakmice_igraci.ofanzivni_skokovi +
        utakmice_igraci.defanzivni_skokovi +
        utakmice_igraci.blokade +
        utakmice_igraci.ukradene_lopte -
        utakmice_igraci.izgubljene_lopte
    ) AS ukupna_korisnost
FROM 
    fantasy_timovi
JOIN 
    fantasy_korisnici ON fantasy_timovi.korisnik_id = fantasy_korisnici.id
JOIN 
    igraci ON fantasy_timovi.izabrani_igrac_id = igraci.id
JOIN 
    utakmice_igraci ON igraci.id = utakmice_igraci.igrac_id
GROUP BY 
    fantasy_korisnici.korisnicko_ime
ORDER BY 2 desc;

-- Prikazuje ekipu od svakog Fantasy korisnika
SELECT 
    fantasy_korisnici.korisnicko_ime,
	-- Ispisuje imena svih igrača koje je korisnik izabrao
    STRING_AGG(igraci.ime + ' ' + igraci.prezime, ', ') AS igraci
FROM 
    fantasy_timovi
JOIN 
    fantasy_korisnici ON fantasy_timovi.korisnik_id = fantasy_korisnici.id
JOIN 
    igraci ON fantasy_timovi.izabrani_igrac_id = igraci.id
GROUP BY 
    fantasy_korisnici.korisnicko_ime;

-- Tabela
SELECT 
    timovi.naziv AS naziv_ekipe,
    SUM(CASE WHEN utakmice_timovi.pobednik = 1 THEN 1 ELSE 0 END) AS broj_pobeda,
    SUM(CASE WHEN utakmice_timovi.pobednik = 0 THEN 1 ELSE 0 END) AS broj_poraza,
	SUM(CASE WHEN utakmice_timovi.pobednik = 1 THEN 2 ELSE 0 END + CASE WHEN utakmice_timovi.pobednik = 0 THEN 1 ELSE 0 END) as bodovi
FROM 
    timovi
JOIN utakmice_timovi ON timovi.id = utakmice_timovi.tim_id
WHERE timovi.liga_id = 1
GROUP BY timovi.naziv
ORDER BY 4 desc




-- REKORDI NA UTAKMICAMA
-- Prikazuje najveće učinke igrača iz svih statističkih parametara, ispisuje u formatu ImeIgrača(ostvarenRekord)
SELECT 
    (SELECT TOP 1 CONCAT(igraci.ime, ' ', igraci.prezime, ' (', 
                         SUM(pogodjeno_trojki * 3 + pogodjeno_dvojki * 2 + pogodjeno_slobodnih_bacanja), ')')
     FROM utakmice_igraci
     JOIN igraci ON utakmice_igraci.igrac_id = igraci.id
     GROUP BY igraci.ime, igraci.prezime, igraci.id, utakmice_igraci.utakmica_id
     ORDER BY SUM(pogodjeno_trojki * 3 + pogodjeno_dvojki * 2 + pogodjeno_slobodnih_bacanja) DESC) AS najvise_poena,

    (SELECT TOP 1 CONCAT(igraci.ime, ' ', igraci.prezime, ' (', 
                         SUM(asistencije), ')')
     FROM utakmice_igraci
     JOIN igraci ON utakmice_igraci.igrac_id = igraci.id
     GROUP BY igraci.ime, igraci.prezime, igraci.id, utakmice_igraci.utakmica_id
     ORDER BY SUM(asistencije) DESC) AS najvise_asistencija,

    (SELECT TOP 1 CONCAT(igraci.ime, ' ', igraci.prezime, ' (', 
                         SUM(ofanzivni_skokovi + defanzivni_skokovi), ')')
     FROM utakmice_igraci
     JOIN igraci ON utakmice_igraci.igrac_id = igraci.id
     GROUP BY igraci.ime, igraci.prezime, igraci.id, utakmice_igraci.utakmica_id
     ORDER BY SUM(ofanzivni_skokovi + defanzivni_skokovi) DESC) AS najvise_skokova,

    (SELECT TOP 1 CONCAT(igraci.ime, ' ', igraci.prezime, ' (', 
                         SUM(ukradene_lopte), ')')
     FROM utakmice_igraci
     JOIN igraci ON utakmice_igraci.igrac_id = igraci.id
     GROUP BY igraci.ime, igraci.prezime, igraci.id, utakmice_igraci.utakmica_id
     ORDER BY SUM(ukradene_lopte) DESC) AS najvise_ukradenih_lopti,

    (SELECT TOP 1 CONCAT(igraci.ime, ' ', igraci.prezime, ' (', 
                         SUM(blokade), ')')
     FROM utakmice_igraci
     JOIN igraci ON utakmice_igraci.igrac_id = igraci.id
     GROUP BY igraci.ime, igraci.prezime, igraci.id, utakmice_igraci.utakmica_id
     ORDER BY SUM(blokade) DESC) AS najvise_blokada,

	 (SELECT TOP 1 CONCAT(igraci.ime, ' ', igraci.prezime, ' (', 
                         SUM(pogodjeno_trojki), ')')
     FROM utakmice_igraci
     JOIN igraci ON utakmice_igraci.igrac_id = igraci.id
     GROUP BY igraci.ime, igraci.prezime, igraci.id, utakmice_igraci.utakmica_id
     ORDER BY SUM(pogodjeno_trojki)DESC) AS najvise_pogodjeno_trojki;

-- Prikazuje ukupnu statistiku za jednu i drugu ekipu na izabranoj utakmici, u ovom slučaju za utakmicu sa izabranim ID 5
SELECT 
    utakmice.id AS utakmica_id,
    timovi.naziv AS tim_naziv,
    SUM(pogodjeno_trojki * 3 + pogodjeno_dvojki * 2 + pogodjeno_slobodnih_bacanja) AS poeni,
	CONCAT(SUM(sutnuto_trojki),'/',SUM(pogodjeno_trojki)) as trojke,
	CONCAT(SUM(sutnuto_dvojki),'/',SUM(pogodjeno_dvojki)) as dvojke,
	CONCAT(SUM(sutnuto_slobodnih_bacanja),'/',SUM(pogodjeno_slobodnih_bacanja)) as slobodna_bacanja,
    SUM(asistencije) AS ukupno_asistencija,
    SUM(ofanzivni_skokovi + defanzivni_skokovi) AS ukupno_skokova,
    SUM(blokade) AS ukupno_blokada,
    SUM(ukradene_lopte) AS ukupno_ukradenih_lopti,
    SUM(faulovi) AS ukupno_faulova,
    SUM(izgubljene_lopte) AS ukupno_izgubljenih_lopti
FROM utakmice_igraci
JOIN igraci ON utakmice_igraci.igrac_id = igraci.id
JOIN timovi ON igraci.tim_id = timovi.id  -- Direktno povezivanje igrača sa njihovim timom
JOIN utakmice ON utakmice_igraci.utakmica_id = utakmice.id
where utakmice.id = 4
GROUP BY utakmice.id, timovi.naziv
order by utakmice.id;

-- Pronađi sve igrače koji su učestvovali u bar jednoj utakmici, ali nemaju nijednu pobedu
SELECT igraci.prezime, igraci.ime, timovi.naziv AS naziv_tima
FROM igraci
-- Spaja tabelu igraci sa tabelom timovi kako bi se dobile informacije o timu svakog igrača
JOIN timovi ON igraci.tim_id = timovi.id
WHERE EXISTS (
    -- Proverava da li postoje utakmice u kojima je igrač učestvovao
    SELECT 1
    FROM utakmice_igraci
    -- Spajanje sa utakmice_timovi da bismo pronašli podatke o timovima u tim utakmicama
    JOIN utakmice_timovi ON utakmice_igraci.utakmica_id = utakmice_timovi.utakmica_id
    -- Spajanje sa tabelom utakmice radi dobijanja informacija o ligi
    JOIN utakmice ON utakmice_timovi.utakmica_id = utakmice.id
    WHERE utakmice_igraci.igrac_id = igraci.id -- Proverava da li je igrač učestvovao u ovoj utakmici
    AND NOT EXISTS (
        -- Proverava da li postoje utakmice u kojima je tim ovog igrača pobedio
        SELECT 1
        FROM utakmice_timovi
        WHERE utakmice_timovi.utakmica_id = utakmice_timovi.utakmica_id -- Isto utakmica
        AND utakmice_timovi.tim_id = timovi.id -- Proverava tim igrača
        AND utakmice_timovi.pobednik = 1 -- Proverava da li je tim pobedio
    )
    -- Ako za igrača ne postoje utakmice u kojima je njegov tim pobedio, igrač se uključuje u rezultat
);

-- prikazuje sve fantasy korisnike koji nisu jos izabrali svoju ekipu
SELECT fantasy_korisnici.id,fantasy_korisnici.korisnicko_ime
FROM fantasy_korisnici
WHERE NOT EXISTS (
    SELECT 1 
    FROM fantasy_timovi
    WHERE fantasy_timovi.korisnik_id = fantasy_korisnici.id
);

-- Prikazuje sve vesti koje su vezane za ekipu sa ID-jem 2
SELECT 
	vesti.naslov,
	vesti.tekst
FROM vesti 
WHERE utakmica_id IN (
SELECT utakmice.id 
FROM utakmice 
JOIN utakmice_timovi ON utakmice_timovi.utakmica_id = utakmice.id 
JOIN timovi ON utakmice_timovi.tim_id = timovi.id
WHERE timovi.id = 2);

-- "Head-to-Head" analiza timova, prikazuje prosecnu statistiku za dve ekipe koje bi potencijalno nekad igrale jedna protiv druge
SELECT
    timovi.naziv as naziv_ekipe,
	

    -- Prose?no poeni, računaju se tako što se ukupan broj poena deli sa brojem odigranih utakmica, takođe se predstavlja kao float
    CAST(
        SUM(pogodjeno_trojki * 3 + pogodjeno_dvojki * 2 + pogodjeno_slobodnih_bacanja) 
        AS FLOAT
    ) / COUNT(DISTINCT utakmice.id) AS prosek_poena,

    -- Prose?no asistencija
    CAST(SUM(asistencije) AS FLOAT) / COUNT(DISTINCT utakmice.id) AS prosek_asistencija,
    
    -- Prose?no skokovi
    CAST(SUM(ofanzivni_skokovi + defanzivni_skokovi) AS FLOAT) / COUNT(DISTINCT utakmice.id) AS prosek_skokova,
    
    -- Prose?no blokade
    CAST(SUM(blokade) AS FLOAT) / COUNT(DISTINCT utakmice.id) AS prosek_blokada,

    -- Prose?no ukradene lopte
    CAST(SUM(ukradene_lopte) AS FLOAT) / COUNT(DISTINCT utakmice.id) AS prosek_ukradenih_lopti,

    -- Prose?no faulovi
    CAST(SUM(faulovi) AS FLOAT) / COUNT(DISTINCT utakmice.id) AS prosek_faulova,

    -- Prose?no izgubljene lopte
    CAST(SUM(izgubljene_lopte) AS FLOAT) / COUNT(DISTINCT utakmice.id) AS prosek_izgubljenih_lopti


FROM utakmice_igraci
JOIN igraci ON utakmice_igraci.igrac_id = igraci.id
JOIN utakmice ON utakmice_igraci.utakmica_id = utakmice.id
JOIN timovi ON igraci.tim_id = timovi.id
WHERE timovi.id = 1 OR timovi.id = 4
GROUP BY timovi.naziv
ORDER BY 3;


-- Brise sve vesti koje su povezane sa ekipom po izboru
DELETE FROM vesti 
WHERE utakmica_id IN (
SELECT utakmice.id 
FROM utakmice 
JOIN utakmice_timovi ON utakmice_timovi.utakmica_id = utakmice.id 
JOIN timovi ON utakmice_timovi.tim_id = timovi.id
WHERE timovi.id = 2);

-- Brise starije vesti
DELETE FROM vesti
WHERE utakmica_id IN (
    SELECT id FROM utakmice WHERE datum_i_vreme < '2024-01-01'
);

-- Brise ekipu koja je prestala da se takmici
DELETE FROM timovi
WHERE id = 27; -- ID tima koji se briše

-- Ažurira tabelu fantasy timovi tako što korisnik sa ID 1 bira novog igrača u svoju ekipu
UPDATE fantasy_timovi SET izabrani_igrac_id = 12  WHERE korisnik_id = 1 AND izabrani_igrac_id = 44 

-- Pomeranje utakmice usled odredjenih razloga
UPDATE utakmice
SET datum_i_vreme = '2024-11-20 18:00:00'
WHERE id = 8; -- ID utakmice koja menja termin

-- Ažurira pobednika za zavrsenu utakmicu
UPDATE utakmice_timovi
SET pobednik = CASE
    WHEN tim_id = 4 THEN 1 -- Postavi na 1 za pobednika
    ELSE 0                 -- Postavi na 0 za poraženog
END
WHERE utakmica_id = 15; -- Ažuriraj oba tima za datu utakmicu


-- drugi deo projekta

-- Kreira se standardni pogled StatistikaIgraci koji prikazuje statistiku igrača u određenoj ligi
GO

CREATE VIEW StatistikaIgraci AS
SELECT
    CONCAT(igraci.ime, ' ', igraci.prezime) AS ime_prezime,
    timovi.naziv AS naziv_ekipe,
    -- Prosečan indeks korisnosti se računa na osnovu zbirnih statistika igrača i deli se sa brojem odigranih utakmica
    -- Koriste se poeni iz različitih šuteva, asistencije, skokovi, ukradene lopte, blokade, a oduzimaju se promašaji i izgubljene lopte
    CAST(
        (
            SUM(pogodjeno_trojki * 3 + pogodjeno_dvojki * 2 + pogodjeno_slobodnih_bacanja) -- Ukupni poeni
            + SUM(asistencije) -- Asistencije
            + SUM(ofanzivni_skokovi + defanzivni_skokovi) -- Skokovi (ofanzivni + defanzivni)
            + SUM(ukradene_lopte) -- Ukradene lopte
            + SUM(blokade) -- Blokade
            - (SUM(sutnuto_trojki) - SUM(pogodjeno_trojki) -- Promašene trojke
               + SUM(sutnuto_dvojki) - SUM(pogodjeno_dvojki) -- Promašene dvojke
               + SUM(sutnuto_slobodnih_bacanja) - SUM(pogodjeno_slobodnih_bacanja)) -- Promašena slobodna bacanja
            - SUM(izgubljene_lopte) -- Izgubljene lopte
        ) AS decimal
    ) / COUNT(DISTINCT utakmice.id) AS prosek_indeks_korisnosti, -- Prosečan indeks korisnosti po utakmici

    -- Prosečan broj poena se računa tako što se ukupan broj poena deli sa brojem odigranih utakmica
    CAST(
        SUM(pogodjeno_trojki * 3 + pogodjeno_dvojki * 2 + pogodjeno_slobodnih_bacanja) 
        AS decimal
    ) / COUNT(DISTINCT utakmice.id) AS prosek_poena, -- Prosečan broj poena po utakmici

    -- Prosečan broj asistencija
    CAST(SUM(asistencije) AS decimal) / COUNT(DISTINCT utakmice.id) AS prosek_asistencija,

    -- Prosečan broj skokova
    CAST(SUM(ofanzivni_skokovi + defanzivni_skokovi) AS decimal) / COUNT(DISTINCT utakmice.id) AS prosek_skokova,

    -- Prosečan broj blokada
    CAST(SUM(blokade) AS decimal) / COUNT(DISTINCT utakmice.id) AS prosek_blokada,

    -- Prosečan broj ukradenih lopti
    CAST(SUM(ukradene_lopte) AS decimal) / COUNT(DISTINCT utakmice.id) AS prosek_ukradenih_lopti,

    -- Prosečan broj faulova
    CAST(SUM(faulovi) AS decimal) / COUNT(DISTINCT utakmice.id) AS prosek_faulova,

    -- Prosečan broj izgubljenih lopti
    CAST(SUM(izgubljene_lopte) AS decimal) / COUNT(DISTINCT utakmice.id) AS prosek_izgubljenih_lopti

FROM utakmice_igraci
JOIN igraci ON utakmice_igraci.igrac_id = igraci.id
JOIN utakmice ON utakmice_igraci.utakmica_id = utakmice.id
JOIN timovi ON igraci.tim_id = timovi.id
WHERE timovi.liga_id = 1 -- Filtriranje igrača koji igraju u određenoj ligi (liga_id = 1)
GROUP BY igrac_id, timovi.naziv, igraci.ime, igraci.prezime




-- Kreiranje pogleda koji sadrži podatke o igračima, timovima i ligama
GO
CREATE VIEW dbo.StatistikaIgracaTimovaLige
WITH SCHEMABINDING AS
SELECT 
    -- Spajanje imena i prezimena igrača u jedan string
    igraci.ime + ' ' + igraci.prezime AS ime_igraca,
    -- Ime tima iz tabele timovi
    timovi.naziv AS naziv_tima,
    -- Ime lige iz tabele lige
    lige.naziv AS naziv_lige
FROM 
    dbo.igraci -- Tabela sa podacima o igračima
JOIN 
    dbo.timovi ON igraci.tim_id = timovi.id -- Spajanje tabele igraci sa tabelom timovi na osnovu tim_id
JOIN 
    dbo.lige ON timovi.liga_id = lige.id; -- Spajanje tabele timovi sa tabelom lige na osnovu liga_id
GO

-- Kreiranje jedinstvenog klasteriranog indeksa na pogledu kako bi se ubrzali upiti
CREATE UNIQUE CLUSTERED INDEX idx_StatistikaIgracaTimovaLige
ON dbo.StatistikaIgracaTimovaLige (ime_igraca, naziv_tima, naziv_lige);
GO

-- Ispisivanje svih podataka iz pogleda
SELECT * FROM dbo.StatistikaIgracaTimovaLige;


-- Kreiramo proceduru za unos statistike igrača u utakmicu
GO
CREATE PROCEDURE InsertUtakmicaIgrac 
    @igrac_id INT,                    -- ID igrača
    @utakmica_id INT,                 -- ID utakmice
    @cetvrtina INT,                   -- Četvrtina utakmice
    @asistencije INT,                 -- Broj asistencija igrača
    @ofanzivni_skokovi INT,           -- Broj ofanzivnih skokova igrača
    @defanzivni_skokovi INT,          -- Broj defanzivnih skokova igrača
    @blokade INT,                     -- Broj blokada igrača
    @ukradene_lopte INT,              -- Broj ukradenih lopti
    @faulovi INT,                     -- Broj faulova
    @izgubljene_lopte INT,            -- Broj izgubljenih lopti
    @sutnuto_trojki INT,              -- Broj pokušaja za trojke
    @pogodjeno_trojki INT,            -- Broj pogodjenih trojki
    @sutnuto_dvojki INT,              -- Broj pokušaja za dvojke
    @pogodjeno_dvojki INT,            -- Broj pogodjenih dvojki
    @sutnuto_slobodnih_bacanja INT,   -- Broj pokušaja za slobodna bacanja
    @pogodjeno_slobodnih_bacanja INT  -- Broj pogodjenih slobodnih bacanja
AS
BEGIN
    -- Proveravamo da li igrač postoji u tabeli igraci
    IF NOT EXISTS (SELECT 1 FROM igraci WHERE id = @igrac_id)
    BEGIN
        -- Ako igrač ne postoji, ubacujemo grešku u tabelu Error_Log
        INSERT INTO Error_Log (error_message)
        VALUES ('Igrač sa ID ' + CAST(@igrac_id AS VARCHAR) + ' ne postoji.');
        RETURN; -- Prekidamo proceduru ako igrač nije pronađen
    END

    -- Proveravamo da li utakmica postoji u tabeli utakmice
    IF NOT EXISTS (SELECT 1 FROM utakmice WHERE id = @utakmica_id)
    BEGIN
        -- Ako utakmica ne postoji, ubacujemo grešku u tabelu Error_Log
        INSERT INTO Error_Log (error_message)
        VALUES ('Utakmica sa ID ' + CAST(@utakmica_id AS VARCHAR) + ' ne postoji.');
        RETURN; -- Prekidamo proceduru ako utakmica nije pronađena
    END

    -- Ako su svi podaci validni, unosimo statistiku u tabelu utakmice_igraci
    INSERT INTO utakmice_igraci (
        igrac_id, utakmica_id, cetvrtina, asistencije, 
        ofanzivni_skokovi, defanzivni_skokovi, blokade, 
        ukradene_lopte, faulovi, izgubljene_lopte, 
        sutnuto_trojki, pogodjeno_trojki, sutnuto_dvojki, 
        pogodjeno_dvojki, sutnuto_slobodnih_bacanja, 
        pogodjeno_slobodnih_bacanja
    ) 
    VALUES (
        @igrac_id, @utakmica_id, @cetvrtina, @asistencije, 
        @ofanzivni_skokovi, @defanzivni_skokovi, @blokade, 
        @ukradene_lopte, @faulovi, @izgubljene_lopte, 
        @sutnuto_trojki, @pogodjeno_trojki, @sutnuto_dvojki, 
        @pogodjeno_dvojki, @sutnuto_slobodnih_bacanja, 
        @pogodjeno_slobodnih_bacanja
    );
END;

-- Kreiramo proceduru za ažuriranje podataka o utakmici
CREATE PROCEDURE UpdateUtakmica 
    @utakmica_id INT,      -- ID utakmice
    @hala_id INT,          -- ID hale u kojoj se utakmica održava
    @datum_vreme DATETIME, -- Datum i vreme utakmice
    @runda VARCHAR(50),    -- Runda utakmice (npr. 1. runda, polufinale)
    @liga_id INT           -- ID lige u kojoj se utakmica igra
AS
BEGIN
    -- Proveravamo da li utakmica postoji u tabeli utakmice
    IF NOT EXISTS (SELECT 1 FROM utakmice WHERE id = @utakmica_id)
    BEGIN
        -- Ako utakmica ne postoji, ubacujemo grešku u tabelu Error_Log
        INSERT INTO Error_Log (error_message)
        VALUES ('Utakmica sa ID ' + CAST(@utakmica_id AS VARCHAR) + ' ne postoji.');
        RETURN; -- Prekidamo proceduru ako utakmica nije pronađena
    END

    -- Proveravamo da li hala postoji u tabeli hale
    IF NOT EXISTS (SELECT 1 FROM hale WHERE id = @hala_id)
    BEGIN
        -- Ako hala ne postoji, ubacujemo grešku u tabelu Error_Log
        INSERT INTO Error_Log (error_message)
        VALUES ('Hala sa ID ' + CAST(@hala_id AS VARCHAR) + ' ne postoji.');
        RETURN; -- Prekidamo proceduru ako hala nije pronađena
    END

    -- Proveravamo da li liga postoji u tabeli lige
    IF NOT EXISTS (SELECT 1 FROM lige WHERE id = @liga_id)
    BEGIN
        -- Ako liga ne postoji, ubacujemo grešku u tabelu Error_Log
        INSERT INTO Error_Log (error_message)
        VALUES ('Liga sa ID ' + CAST(@liga_id AS VARCHAR) + ' ne postoji.');
        RETURN; -- Prekidamo proceduru ako liga nije pronađena
    END

    -- Ako su svi podaci ispravni, ažuriramo podatke o utakmici u tabeli utakmice
    UPDATE utakmice
    SET hala_id = @hala_id,                -- Ažuriramo ID hale
        datum_i_vreme = @datum_vreme,      -- Ažuriramo datum i vreme utakmice
        runda = @runda,                    -- Ažuriramo rundu utakmice
        liga_id = @liga_id                 -- Ažuriramo ID lige
    WHERE id = @utakmica_id;               -- Ažuriramo samo utakmicu sa odgovarajućim ID-em
END;

-- Kreiramo proceduru za brisanje fantasy tima
CREATE PROCEDURE DeleteFantasyTim
    @tim_id INT  -- ID fantasy tima koji treba da bude obrisan
AS
BEGIN
    -- Proveravamo da li fantasy tim postoji u tabeli fantasy_timovi
    IF NOT EXISTS (SELECT 1 FROM fantasy_timovi WHERE id = @tim_id)
    BEGIN
        -- Ako fantasy tim sa zadatim ID-jem ne postoji, ubacujemo grešku u tabelu Error_Log
        INSERT INTO Error_Log (error_message)
        VALUES ('Fantasy tim sa ID ' + CAST(@tim_id AS VARCHAR) + ' ne postoji.');
        RETURN; -- Prekidamo izvršavanje procedure ako fantasy tim nije pronađen
    END

    -- Ako fantasy tim postoji, brišemo ga iz tabele fantasy_timovi
    DELETE FROM fantasy_timovi
    WHERE id = @tim_id;
END;




-- Kreiramo proceduru za dobijanje stranice rezultata
CREATE PROCEDURE DobaviStranicuRezultata
    @BrojStrane INT,         -- Broj strane (npr. 1, 2, 3...)
    @RedoviPoStrani INT      -- Broj redova po strani
AS
BEGIN
    -- Računanje offset-a (broj redova koji treba preskočiti)
    DECLARE @Preskoci INT = (@BrojStrane - 1) * @RedoviPoStrani;

    -- Izvlačenje podataka sa straničenjem i JOIN-om
    SELECT 
        igraci.id AS IgracID,            -- ID igrača
        igraci.ime AS ImeIgraca,         -- Ime igrača
        igraci.prezime AS PrezimeIgraca, -- Prezime igrača
        igraci.broj_na_dresu AS BrojNaDresu, -- Broj na dresu igrača
        timovi.naziv AS NazivTima,      -- Naziv tima igrača
        lige.naziv AS NazivLige        -- Naziv lige tima igrača
    FROM igraci
    INNER JOIN timovi ON igraci.tim_id = timovi.id  -- Spajanje sa tabelom timovi
    INNER JOIN lige ON timovi.liga_id = lige.id    -- Spajanje sa tabelom lige
    ORDER BY igraci.id  -- Sortiranje po ID-u igrača (možete promeniti prema potrebama)
    OFFSET @Preskoci ROWS FETCH NEXT @RedoviPoStrani ROWS ONLY;  -- Straničenje: preskočimo određeni broj redova i uzimamo samo traženi broj redova
END;

-- Poziv procedure za dobijanje druge strane sa 5 redova po strani
EXEC DobaviStranicuRezultata 
    @BrojStrane = 2, 
    @RedoviPoStrani = 5;




go
-- Kreiramo funkciju za izračunavanje proseka poena igrača
CREATE FUNCTION dbo.ProsekPoenaIgraca (
    @igrac_id INT -- ID igrača za kojeg izračunavamo prosek poena
)
RETURNS DECIMAL(10, 2) -- Funkcija vraća decimalni broj sa dve decimale
AS
BEGIN
    -- Deklaracija promenljive za čuvanje proseka poena
    DECLARE @prosek_poena DECIMAL(10, 2);

    -- Izračunavanje proseka poena na osnovu učinka igrača u utakmicama
    SELECT @prosek_poena = 
        CASE
            -- Ako igrač nije odigrao nijednu utakmicu, prosek je 0
            WHEN COUNT(DISTINCT ui.utakmica_id) = 0 THEN 0
            ELSE 
                -- Ako igrač ima odigrane utakmice, računamo prosek poena
                CAST(SUM(
                    (pogodjeno_trojki * 3) +   -- 3 poena za svaki pogodak sa trojke
                    (pogodjeno_dvojki * 2) +   -- 2 poena za svaki pogodak sa dvojke
                    pogodjeno_slobodnih_bacanja -- 1 poen za svako pogođeno slobodno bacanje
                ) AS DECIMAL(10, 2)) 
                / COUNT(DISTINCT ui.utakmica_id) -- Delimo sa brojem odigranih utakmica da bismo dobili prosek
        END
    FROM utakmice_igraci ui
    WHERE ui.igrac_id = @igrac_id; -- Filtriramo po ID-ju igrača

    -- Vraćanje izračunatog proseka poena
    RETURN @prosek_poena;
END;
GO

-- Pozivanje funkcije za igrača sa ID-jem 7
SELECT dbo.ProsekPoenaIgraca(7) AS ProsekPoena;





GO
-- Kreiramo funkciju koja vraća statistiku igrača za određenu utakmicu
CREATE FUNCTION dbo.fn_IgraciStatistikaNaUtakmici (
	@utakmica_id INT  -- ID utakmice za koju želimo da dobijemo statistiku igrača
)
RETURNS TABLE  -- Funkcija vraća tabelu rezultata
AS
RETURN
(
	-- Izbor podataka o utakmici i statistici igrača
	SELECT
		-- Ime utakmice, sa nazivima obe ekipe (pobednik vs poraženi)
		CONCAT(
			(SELECT timovi.naziv FROM timovi WHERE timovi.id = ekipa_pobednik.tim_id), 
			' vs ',
			(SELECT timovi.naziv FROM timovi WHERE timovi.id = ekipa_porazeni.tim_id)
		) AS utakmica,
		
		-- Naziv tima igrača
		timovi.naziv as naziv_ekipe,
		
		-- Ime i prezime igrača
		CONCAT(igraci.ime, ' ', igraci.prezime) AS ime_prezime,
		
		-- Sumiranje poena (trojke, dvojke, slobodna bacanja)
		SUM(pogodjeno_trojki * 3 + pogodjeno_dvojki * 2 + pogodjeno_slobodnih_bacanja) AS poeni,
		
		-- Sumiranje asistencija
		SUM(asistencije) AS ukupno_asistencija,
		
		-- Sumiranje ofanzivnih skokova
		SUM(ofanzivni_skokovi) AS ukupno_ofanzivni_skokovi,
		
		-- Sumiranje defanzivnih skokova
		SUM(defanzivni_skokovi) AS ukupno_defanzivni_skokovi,
		
		-- Ukupno skokova (ofanzivni + defanzivni)
		SUM(ofanzivni_skokovi + defanzivni_skokovi) AS ukupno_skokova,
		
		-- Sumiranje blokada
		SUM(blokade) AS ukupno_blokada,
		
		-- Sumiranje ukradenih lopti
		SUM(ukradene_lopte) AS ukupno_ukradenih_lopti,
		
		-- Sumiranje faulova
		SUM(faulovi) AS ukupno_faulova,
		
		-- Sumiranje izgubljenih lopti
		SUM(izgubljene_lopte) AS ukupno_izgubljenih_lopti,
		
		-- Odnos šutnutih i pogodjenih trojki
		CONCAT(SUM(sutnuto_trojki), '/', SUM(pogodjeno_trojki)) AS trojke,
		
		-- Odnos šutnutih i pogodjenih dvojki
		CONCAT(SUM(sutnuto_dvojki), '/', SUM(pogodjeno_dvojki)) AS dvojke,
		
		-- Odnos šutnutih i pogodjenih slobodnih bacanja
		CONCAT(SUM(sutnuto_slobodnih_bacanja), '/', SUM(pogodjeno_slobodnih_bacanja)) AS slobodna_bacanja,
		
		-- Indeks korisnosti igrača (poeni + asistencije + skokovi + ukradene lopte + blokade - promašaji - izgubljene lopte)
		(SUM(pogodjeno_trojki * 3 + pogodjeno_dvojki * 2 + pogodjeno_slobodnih_bacanja) 
		+ SUM(asistencije) 
		+ SUM(ofanzivni_skokovi + defanzivni_skokovi) 
		+ SUM(ukradene_lopte) 
		+ SUM(blokade) 
		- (SUM(sutnuto_trojki) - SUM(pogodjeno_trojki) 
		   + SUM(sutnuto_dvojki) - SUM(pogodjeno_dvojki) 
		   + SUM(sutnuto_slobodnih_bacanja) - SUM(pogodjeno_slobodnih_bacanja)) 
		- SUM(izgubljene_lopte)) AS indeks_korisnosti
	
	FROM utakmice_igraci  -- Veza sa tabelom utakmice_igraci
	JOIN igraci ON utakmice_igraci.igrac_id = igraci.id  -- Veza sa tabelom igraci
	JOIN utakmice ON utakmice_igraci.utakmica_id = utakmice.id  -- Veza sa tabelom utakmice
	JOIN timovi ON igraci.tim_id = timovi.id  -- Veza sa tabelom timovi
	-- Pridružujemo obe ekipe: pobednika i poraženog
	JOIN utakmice_timovi ekipa_pobednik ON utakmice.id = ekipa_pobednik.utakmica_id AND ekipa_pobednik.pobednik = 1
	JOIN utakmice_timovi ekipa_porazeni ON utakmice.id = ekipa_porazeni.utakmica_id AND ekipa_porazeni.pobednik = 0
	-- Filtriramo po ID-ju utakmice
	WHERE utakmice.id = @utakmica_id
	
	-- Grupisanje po igračima i njihovim timovima
	GROUP BY igraci.ime, igraci.prezime, timovi.naziv, ekipa_pobednik.tim_id, ekipa_porazeni.tim_id
);
GO

SELECT * FROM dbo.fn_IgraciStatistikaNaUtakmici(1);



-- Kreira trigger trg_validiraj_timove_i_lige koji se aktivira nakon svakog INSERT unosa u tabelu utakmice_timovi.
GO
CREATE TRIGGER trg_validiraj_timove_i_lige
ON utakmice_timovi
AFTER INSERT
AS
BEGIN
    -- Proveravamo da li svi timovi koji su dodati pripadaju istoj ligi kao utakmica
    IF EXISTS (
        SELECT 1
        FROM INSERTED i
        JOIN utakmice u ON i.utakmica_id = u.id
        JOIN timovi t ON i.tim_id = t.id
        WHERE t.liga_id != u.liga_id
    )
    BEGIN
        -- Ako timovi nisu iz iste lige, prekidamo unos i vraćamo grešku
        RAISERROR ('Timovi koji igraju utakmicu moraju pripadati istoj ligi kao utakmica!', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- Pokušaj dodavanja tima iz druge lige u utakmicu lige 1
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik)
VALUES (1, 3, NULL); -- Ovo će izazvati grešku

select * from timovi
select * from utakmice

insert into utakmice (hala_id,datum_i_vreme,runda,liga_id) VALUES (1,'2025-02-15 11:00:00.000',5,1)

INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik)
VALUES (51, 13, NULL); -- Ovo će izazvati grešku
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik)
VALUES (51, 14, NULL); -- Ovo će izazvati grešku


-- Definicija triggera koji se aktivira umesto standardnog INSERT-a u tabelu utakmice_timovi
GO
CREATE TRIGGER trg_instead_of_insert_utakmice_timovi
ON utakmice_timovi
INSTEAD OF INSERT
AS
BEGIN
    -- Proveravamo da li pokušavate da dodate isti tim kao protivnika
    IF EXISTS (
        SELECT 1
        FROM INSERTED i
        JOIN utakmice_timovi ut ON ut.utakmica_id = i.utakmica_id
        WHERE ut.tim_id = i.tim_id  -- Ako je tim već unesen u utakmicu
           OR (SELECT COUNT(DISTINCT tim_id) 
               FROM utakmice_timovi 
               WHERE utakmica_id = i.utakmica_id) + 
              (SELECT COUNT(DISTINCT tim_id) 
               FROM INSERTED 
               WHERE utakmica_id = i.utakmica_id) < 2 -- Ako je broj timova manji od 2
    )
    BEGIN
        -- Ako je uslov ispunjen, javlja grešku i poništava unos
        RAISERROR ('Timovi koji igraju utakmicu moraju biti različiti!', 16, 1);
        ROLLBACK TRANSACTION;  -- Poništava transakciju (unos)
        RETURN;  -- Prekida dalje izvršavanje triggera
    END;

    -- Dodajemo unose sa automatskom vrednošću za pobednika (NULL)
    INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik)
    SELECT utakmica_id, tim_id, NULL  -- Pobednik je inicijalno NULL
    FROM INSERTED;  -- Preuzimamo podatke koji su pokušani za unos
END;




-- Pokušaj dodavanja istog tima za utakmicu
INSERT INTO utakmice_timovi (utakmica_id, tim_id, pobednik)
VALUES (1, 1, NULL), (1, 1, NULL); -- Ovo će izazvati grešku


-- Kreira log mehanizam za praćenje DDL događaja, kao što su CREATE, ALTER, i DROP operacije na tabelama u bazi podataka.
CREATE TABLE DDL_Log (
    id INT IDENTITY(1,1) PRIMARY KEY,
    event_type NVARCHAR(100),     -- Tip događaja (CREATE, ALTER, DROP)
    object_name NVARCHAR(255),    -- Naziv objekta
    object_type NVARCHAR(100),    -- Tip objekta (TABLE, VIEW, PROCEDURE, itd.)
    event_date DATETIME DEFAULT GETDATE(), -- Datum i vreme događaja
    executed_by NVARCHAR(255)     -- Korisnik koji je izvršio akciju
);
go
CREATE TRIGGER DDL_Table_Changes
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
    SET NOCOUNT ON;

    -- Ubacivanje podataka o događaju u DDL_Log
    INSERT INTO DDL_Log (event_type, object_name, object_type, executed_by)
    SELECT 
        EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'NVARCHAR(100)') AS event_type,
        EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'NVARCHAR(255)') AS object_name,
        EVENTDATA().value('(/EVENT_INSTANCE/ObjectType)[1]', 'NVARCHAR(100)') AS object_type,
        SYSTEM_USER AS executed_by;
END;

-- Testiranje DDL okidaca
CREATE TABLE TestTable (
    id INT PRIMARY KEY,
    naziv NVARCHAR(50)
);

-- Kreira proceduru DodajUtakmicuSaTimovima koja dodaje novu utakmicu sa dva tima u bazi podataka, uz odgovarajuće provere, transakcije i rukovanje greškama.
go
CREATE PROCEDURE DodajUtakmicuSaTimovima
    @HalaID INT,              -- ID hale gde se utakmica igra
    @DatumIVreme DATETIME,    -- Datum i vreme utakmice
    @Runda INT,               -- Runda u kojoj se utakmica igra
    @LigaID INT,              -- ID lige u kojoj se utakmica igra
    @Tim1ID INT,              -- ID prvog tima
    @Tim2ID INT               -- ID drugog tima
AS
BEGIN
    -- Proveravamo da li su timovi različiti
    IF @Tim1ID = @Tim2ID
    BEGIN
        THROW 50000, 'Timovi koji igraju utakmicu moraju biti različiti!', 1;
        RETURN;
    END;

    -- Proveravamo da li timovi pripadaju istoj ligi
    IF NOT EXISTS (
        SELECT 1
        FROM timovi t1
        JOIN timovi t2 ON t1.id = @Tim1ID AND t2.id = @Tim2ID
        WHERE t1.liga_id = @LigaID AND t2.liga_id = @LigaID
    )
    BEGIN
        THROW 50000, 'Timovi ne pripadaju istoj ligi!', 1;
        RETURN;
    END;

    -- Početak transakcije
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Dodavanje nove utakmice
        DECLARE @NovaUtakmicaID INT;
        PRINT 'Dodavanje nove utakmice...'; -- Dijagnostika
        INSERT INTO utakmice (hala_id, datum_i_vreme, runda, liga_id)
        VALUES (@HalaID, @DatumIVreme, @Runda, @LigaID);

        -- Dobavljanje ID-a nove utakmice
        SET @NovaUtakmicaID = SCOPE_IDENTITY();
        PRINT 'Nova utakmica ID: ' + CAST(@NovaUtakmicaID AS NVARCHAR(50)); -- Dijagnostika

        -- Dodavanje timova u tabelu utakmice_timovi
        PRINT 'Dodavanje tima 1...'; -- Dijagnostika
        INSERT INTO utakmice_timovi (utakmica_id, tim_id) VALUES (@NovaUtakmicaID, @Tim1ID);

        PRINT 'Dodavanje tima 2...'; -- Dijagnostika
        INSERT INTO utakmice_timovi (utakmica_id, tim_id) VALUES (@NovaUtakmicaID, @Tim2ID);

        -- Potvrda transakcije
        PRINT 'Potvrda transakcije...'; -- Dijagnostika
        COMMIT TRANSACTION;
        PRINT 'Transakcija uspešna!'; -- Dijagnostika
    END TRY
    BEGIN CATCH
        -- Poništavanje transakcije u slučaju greške
        ROLLBACK TRANSACTION;

        -- Prikazivanje greške
        DECLARE @PorukaGreske NVARCHAR(4000) = ERROR_MESSAGE();
        PRINT 'Greška: ' + @PorukaGreske; -- Dijagnostika
        THROW 50000, @PorukaGreske, 1;
    END CATCH;
END;

-- Poziv procedure sa primerom podataka
EXEC DodajUtakmicuSaTimovima 
    @HalaID = 1, 
    @DatumIVreme = '2025-01-15 19:00:00', 
    @Runda = 3, 
    @LigaID = 1, 
    @Tim1ID = 5, 
    @Tim2ID = 6; -- Različiti ID-ovi timova



select * from utakmice



select * from DDL_Log

--Simulacija Deadlock-a
-- Kreiramo dve tabele
CREATE TABLE Tabela1 (
    ID INT PRIMARY KEY,
    Podaci NVARCHAR(50)
);

CREATE TABLE Tabela2 (
    ID INT PRIMARY KEY,
    Podaci NVARCHAR(50)
);

-- Unosimo podatke
INSERT INTO Tabela1 (ID, Podaci) VALUES (1, 'Podatak1');
INSERT INTO Tabela2 (ID, Podaci) VALUES (1, 'Podatak2');

--Prva sesija
BEGIN TRANSACTION;

-- Zaključavanje reda u Tabela1
UPDATE Tabela1
SET Podaci = 'Promenjen1'
WHERE ID = 1;

-- Simulacija čekanja
WAITFOR DELAY '00:00:10';

-- Pokušaj zaključavanja reda u Tabela2
UPDATE Tabela2
SET Podaci = 'Promenjen2'
WHERE ID = 1;

-- Potvrda transakcije
COMMIT;

--Druga sesija
BEGIN TRANSACTION;

-- Zaključavanje reda u Tabela2
UPDATE Tabela2
SET Podaci = 'Promenjen2'
WHERE ID = 1;

-- Simulacija čekanja
WAITFOR DELAY '00:00:10';

-- Pokušaj zaključavanja reda u Tabela1
UPDATE Tabela1
SET Podaci = 'Promenjen1'
WHERE ID = 1;

-- Potvrda transakcije
COMMIT;

--READ UNCOMMITTED

-- Prva transakcija: Ažuriranje podataka u tabeli utakmice
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

BEGIN TRANSACTION;

-- Ažuriranje podataka o utakmici sa ID = 1 (npr. dodajemo rezultat)
UPDATE utakmice
SET datum_i_vreme = '2025-01-15 20:00:00'
WHERE id = 1;

-- Simuliramo čekanje kako bi omogućili drugoj transakciji da pročita podatke
WAITFOR DELAY '00:00:05';  -- Čekamo 5 sekundi

-- Potvrda transakcije
COMMIT TRANSACTION;


-- Druga transakcija: Čitanje podataka dok je prva transakcija u toku
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

BEGIN TRANSACTION;

-- Čitanje podataka iz tabele utakmice
SELECT *
FROM utakmice
WHERE id = 1;

-- Završavamo transakciju
COMMIT TRANSACTION;

-- Postavljamo izolacioni nivo na READ COMMITTED
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Prva transakcija: Ažurira podatke o utakmici
BEGIN TRANSACTION;

-- Ažuriramo podatke za određenu utakmicu
UPDATE utakmice
SET datum_i_vreme = '2025-01-20 18:00:00'
WHERE id = 1;

-- Simuliramo čekanje kako bi druga transakcija pokušala da pročita podatke
WAITFOR DELAY '00:00:10'; -- Čekamo 10 sekundi

-- Potvrđujemo transakciju
COMMIT TRANSACTION;


-- Druga transakcija: Čita podatke dok je prva transakcija u toku
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

BEGIN TRANSACTION;

-- Pokušavamo da čitamo podatke za istu utakmicu
SELECT id, hala_id, datum_i_vreme, runda, liga_id
FROM utakmice
WHERE id = 1;

-- Završavamo transakciju
COMMIT TRANSACTION;

-- Postavljamo izolacioni nivo na REPEATABLE READ
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Prva transakcija: Čita podatke i simulira obradu
BEGIN TRANSACTION;

-- Čitanje podataka iz tabele utakmice (npr. utakmica sa ID 1)
SELECT id, hala_id, datum_i_vreme, runda, liga_id
FROM utakmice
WHERE id = 1;

-- Simuliramo obradu (kašnjenje od 10 sekundi)
WAITFOR DELAY '00:00:10'; -- Čekamo 10 sekundi

-- Završavamo transakciju
COMMIT TRANSACTION;


-- Druga transakcija: Pokušava da ažurira iste podatke dok je prva transakcija aktivna
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

BEGIN TRANSACTION;

-- Pokušaj ažuriranja istih podataka
UPDATE utakmice
SET datum_i_vreme = '2025-01-21 20:00:00'
WHERE id = 1;

-- Završavamo transakciju
COMMIT TRANSACTION;

-- Vraća rezultate upita kao XML
SELECT 
    igraci.prezime AS Prezime,
    igraci.ime AS Ime,
    timovi.naziv AS Naziv_Tima
FROM igraci
JOIN timovi ON igraci.tim_id = timovi.id
WHERE EXISTS (
    SELECT 1
    FROM utakmice_igraci
    JOIN utakmice_timovi ON utakmice_igraci.utakmica_id = utakmice_timovi.utakmica_id
    JOIN utakmice ON utakmice_timovi.utakmica_id = utakmice.id
    WHERE utakmice_igraci.igrac_id = igraci.id
    AND NOT EXISTS (
        SELECT 1
        FROM utakmice_timovi
        WHERE utakmice_timovi.utakmica_id = utakmice_timovi.utakmica_id
        AND utakmice_timovi.tim_id = timovi.id
        AND utakmice_timovi.pobednik = 1
    )
)
FOR XML PATH('Igrac'), ROOT('Igraci');

--Parsira i transformiše XML podatke pomoću OPENXML funkcije

-- XML podaci
DECLARE @xmlData XML = '<Igraci>
  <Igrac>
    <Prezime>Kapor</Prezime>
    <Ime>Uroš</Ime>
    <Naziv_Tima>KK Zvezdara</Naziv_Tima>
  </Igrac>
  <Igrac>
    <Prezime>Miljuš</Prezime>
    <Ime>Bogdan</Ime>
    <Naziv_Tima>KK Zvezdara</Naziv_Tima>
  </Igrac>
  <Igrac>
    <Prezime>Ajrizaj</Prezime>
    <Ime>Naser</Ime>
    <Naziv_Tima>KK Zvezdara</Naziv_Tima>
  </Igrac>
  <Igrac>
    <Prezime>?or?evi?</Prezime>
    <Ime>Dejan</Ime>
    <Naziv_Tima>KK Zvezdara</Naziv_Tima>
  </Igrac>
  <Igrac>
    <Prezime>Pavlovi?</Prezime>
    <Ime>Lazar</Ime>
    <Naziv_Tima>KK Zvezdara</Naziv_Tima>
  </Igrac>
  <Igrac>
    <Prezime>Ilijevi?</Prezime>
    <Ime>Matija</Ime>
    <Naziv_Tima>KK Zvezdara</Naziv_Tima>
  </Igrac>
  <Igrac>
    <Prezime>Mi?unovi?</Prezime>
    <Ime>Marko</Ime>
    <Naziv_Tima>KK Zvezdara</Naziv_Tima>
  </Igrac>
  <Igrac>
    <Prezime>Škari?</Prezime>
    <Ime>Mihailo</Ime>
    <Naziv_Tima>KK Zvezdara</Naziv_Tima>
  </Igrac>
  <Igrac>
    <Prezime>Stamenkovi?</Prezime>
    <Ime>Strahinja</Ime>
    <Naziv_Tima>KK Zvezdara</Naziv_Tima>
  </Igrac>
  <Igrac>
    <Prezime>Obu?ina</Prezime>
    <Ime>Vladimir</Ime>
    <Naziv_Tima>AST</Naziv_Tima>
  </Igrac>
  <Igrac>
    <Prezime>Nasti?</Prezime>
    <Ime>Vladimir</Ime>
    <Naziv_Tima>AST</Naziv_Tima>
  </Igrac>
  <Igrac>
    <Prezime>Mili?i?</Prezime>
    <Ime>Dušan</Ime>
    <Naziv_Tima>AST</Naziv_Tima>
  </Igrac>
  <Igrac>
    <Prezime>Sarajli?</Prezime>
    <Ime>Vladimir</Ime>
    <Naziv_Tima>AST</Naziv_Tima>
  </Igrac>
  <Igrac>
    <Prezime>Radosavljevi?</Prezime>
    <Ime>Nemanja</Ime>
    <Naziv_Tima>AST</Naziv_Tima>
  </Igrac>
  <Igrac>
    <Prezime>Stojakovi?</Prezime>
    <Ime>Nikola</Ime>
    <Naziv_Tima>AST</Naziv_Tima>
  </Igrac>
  <Igrac>
    <Prezime>Radenkovi?</Prezime>
    <Ime>Aleksandar</Ime>
    <Naziv_Tima>AST</Naziv_Tima>
  </Igrac>
  <Igrac>
    <Prezime>Lazi?</Prezime>
    <Ime>Bogdan</Ime>
    <Naziv_Tima>KK Baroni</Naziv_Tima>
  </Igrac>
  <Igrac>
    <Prezime>Markovi?</Prezime>
    <Ime>Igor</Ime>
    <Naziv_Tima>KK Baroni</Naziv_Tima>
  </Igrac>
  <Igrac>
    <Prezime>Vasiljevi?</Prezime>
    <Ime>Nemanja</Ime>
    <Naziv_Tima>KK Baroni</Naziv_Tima>
  </Igrac>
  <Igrac>
    <Prezime>Jankovi?</Prezime>
    <Ime>Goran</Ime>
    <Naziv_Tima>KK Baroni</Naziv_Tima>
  </Igrac>
  <Igrac>
    <Prezime>Miti?</Prezime>
    <Ime>Tomas</Ime>
    <Naziv_Tima>KK Baroni</Naziv_Tima>
  </Igrac>
  <Igrac>
    <Prezime>Marinkovi?</Prezime>
    <Ime>Rade</Ime>
    <Naziv_Tima>KK Baroni</Naziv_Tima>
  </Igrac>
  <Igrac>
    <Prezime>Pavlovi?</Prezime>
    <Ime>Mihailo</Ime>
    <Naziv_Tima>KK Baroni</Naziv_Tima>
  </Igrac>
</Igraci>';

-- Kreiranje XML handler-a
DECLARE @docHandle INT;
EXEC sp_xml_preparedocument @docHandle OUTPUT, @xmlData;

-- Parsiranje XML-a pomoću OPENXML
SELECT *
INTO #TempIgraci -- Kreiramo privremenu tabelu za unos
FROM OPENXML(@docHandle, '/Igraci/Igrac', 2) 
WITH (
    Prezime NVARCHAR(50) 'Prezime',
    Ime NVARCHAR(50) 'Ime',
    Naziv_Tima NVARCHAR(50) 'Naziv_Tima'
);

-- Pregled podataka iz privremene tabele
SELECT * FROM #TempIgraci;

-- Oslobađanje XML handler-a
EXEC sp_xml_removedocument @docHandle;

-- Brisanje privremene tabele
DROP TABLE #TempIgraci;

--Vraća rezultate upita kao JSON

SELECT 
    fantasy_korisnici.id AS KorisnikID, 
    fantasy_korisnici.korisnicko_ime AS KorisnickoIme
FROM 
    fantasy_korisnici
WHERE 
    NOT EXISTS (
        SELECT 1 
        FROM fantasy_timovi
        WHERE fantasy_timovi.korisnik_id = fantasy_korisnici.id
    )
FOR JSON AUTO, INCLUDE_NULL_VALUES;

----Parsira i transformiše XML podatke pomoću OPENXML funkcije

DECLARE @Json NVARCHAR(MAX) = 
'[
    {"KorisnikID":11,"KorisnickoIme":"idjordjevic509"},
    {"KorisnikID":12,"KorisnickoIme":"ajovanovic110"},
    {"KorisnikID":13,"KorisnickoIme":"pperic161"},
    {"KorisnikID":14,"KorisnickoIme":"snikolic845"},
    {"KorisnikID":15,"KorisnickoIme":"djovanovic723"},
    {"KorisnikID":16,"KorisnickoIme":"istefanovic328"},
    {"KorisnikID":17,"KorisnickoIme":"peric593"},
    {"KorisnikID":18,"KorisnickoIme":"ipetrovic705"},
    {"KorisnikID":19,"KorisnickoIme":"asavic460"},
    {"KorisnikID":20,"KorisnickoIme":"mjovanovic909"},
    {"KorisnikID":21,"KorisnickoIme":"nikolic387"},
    {"KorisnikID":22,"KorisnickoIme":"ijovanovic695"},
    {"KorisnikID":23,"KorisnickoIme":"smitrovic763"},
    {"KorisnikID":24,"KorisnickoIme":"apetrovic883"},
    {"KorisnikID":25,"KorisnickoIme":"nikolic634"},
    {"KorisnikID":26,"KorisnickoIme":"dsavic102"},
    {"KorisnikID":27,"KorisnickoIme":"jperic243"},
    {"KorisnikID":28,"KorisnickoIme":"djovanovic505"},
    {"KorisnikID":29,"KorisnickoIme":"astefanovic826"},
    {"KorisnikID":30,"KorisnickoIme":"dnikolic288"},
    {"KorisnikID":31,"KorisnickoIme":"pmilos654"},
    {"KorisnikID":32,"KorisnickoIme":"istefanovic947"},
    {"KorisnikID":33,"KorisnickoIme":"asavic217"},
    {"KorisnikID":34,"KorisnickoIme":"npopovic374"},
    {"KorisnikID":35,"KorisnickoIme":"djovanovic711"},
    {"KorisnikID":36,"KorisnickoIme":"mmitrovic527"},
    {"KorisnikID":37,"KorisnickoIme":"istefanovic956"},
    {"KorisnikID":38,"KorisnickoIme":"ppopovic432"},
    {"KorisnikID":39,"KorisnickoIme":"mmitrovic297"},
    {"KorisnikID":40,"KorisnickoIme":"iljiljana109"},
    {"KorisnikID":41,"KorisnickoIme":"ikovacevic455"},
    {"KorisnikID":42,"KorisnickoIme":"dnikolic671"},
    {"KorisnikID":43,"KorisnickoIme":"asavic230"},
    {"KorisnikID":44,"KorisnickoIme":"jkovacevic889"},
    {"KorisnikID":45,"KorisnickoIme":"nmilos719"},
    {"KorisnikID":46,"KorisnickoIme":"akrstic306"},
    {"KorisnikID":47,"KorisnickoIme":"dmitrovic411"},
    {"KorisnikID":48,"KorisnickoIme":"pmitrovic290"},
    {"KorisnikID":49,"KorisnickoIme":"jmilos564"},
    {"KorisnikID":50,"KorisnickoIme":"mmijatovic98"}
]';

SELECT 
    Korisnik.KorisnikID,
    Korisnik.KorisnickoIme
FROM OPENJSON(@Json)
WITH (
    KorisnikID INT '$.KorisnikID',
    KorisnickoIme NVARCHAR(100) '$.KorisnickoIme'
) AS Korisnik;



