CREATE TABLE Person (
 persnr INT NOT NULL,
 vname VARCHAR(15),
 nname VARCHAR(15),
 geschlecht CHAR(1),
 gebdat DATE
);

ALTER TABLE Person ADD CONSTRAINT PK_Person PRIMARY KEY (persnr);


CREATE TABLE Spieler (
 persnr INT NOT NULL,
 gehalt INT,
 position VARCHAR(10),
 von DATE,
 bis DATE
);

ALTER TABLE Spieler ADD CONSTRAINT PK_Spieler PRIMARY KEY (persnr);


CREATE TABLE Standort (
 sid INT NOT NULL,
 land VARCHAR(20),
 plz INT,
 ort VARCHAR(20)
);

ALTER TABLE Standort ADD CONSTRAINT PK_Standort PRIMARY KEY (sid);


CREATE TABLE Trainer (
 persnr INT NOT NULL,
 gehalt INT,
 von DATE,
 bis DATE
);

ALTER TABLE Trainer ADD CONSTRAINT PK_Trainer PRIMARY KEY (persnr);


CREATE TABLE Angestellter (
 persnr INT NOT NULL,
 gehalt INT,
 ueberstunden INT,
 e_mail VARCHAR(30)
);

ALTER TABLE Angestellter ADD CONSTRAINT PK_Angestellter PRIMARY KEY (persnr);


CREATE TABLE betreut (
 persnr INT NOT NULL,
 sid INT NOT NULL,
 anfang DATE,
 ende DATE
);

ALTER TABLE betreut ADD CONSTRAINT PK_betreut PRIMARY KEY (persnr,sid);


CREATE TABLE Mannschaft (
 bezeichnung VARCHAR(50) NOT NULL,
 cheftrainer INT,
 asitrainer INT,
 klasse VARCHAR(10)
);

ALTER TABLE Mannschaft ADD CONSTRAINT PK_Mannschaft PRIMARY KEY (bezeichnung);


CREATE TABLE Mitglied (
 persnr INT NOT NULL,
 beitrag CHAR(10)
);

ALTER TABLE Mitglied ADD CONSTRAINT PK_Mitglied PRIMARY KEY (persnr);


CREATE TABLE Spiel (
 Datum DATE NOT NULL,
 bezeichnung VARCHAR(50) NOT NULL,
 persnr INT NOT NULL,
 gegner VARCHAR(20),
 ergebnis VARCHAR(15),
 dauer FLOAT(200)
);

ALTER TABLE Spiel ADD CONSTRAINT PK_Spiel PRIMARY KEY (Datum,bezeichnung,persnr);


CREATE TABLE spielt in (
 persnr INT NOT NULL,
 nummer CHAR(10) NOT NULL,
 bezeichnung VARCHAR(50) NOT NULL
);

ALTER TABLE spielt in ADD CONSTRAINT PK_spielt in PRIMARY KEY (persnr,nummer,bezeichnung);


CREATE TABLE Fanclub (
 sid INT NOT NULL,
 name VARCHAR(50) NOT NULL,
 gegruendet DATE,
 obmann INT,
 nummer CHAR(10),
 bezeichnung VARCHAR(50)
);

ALTER TABLE Fanclub ADD CONSTRAINT PK_Fanclub PRIMARY KEY (sid,name);


ALTER TABLE Spieler ADD CONSTRAINT FK_Spieler_0 FOREIGN KEY (persnr) REFERENCES Person (persnr);


ALTER TABLE Trainer ADD CONSTRAINT FK_Trainer_0 FOREIGN KEY (persnr) REFERENCES Person (persnr);


ALTER TABLE Angestellter ADD CONSTRAINT FK_Angestellter_0 FOREIGN KEY (persnr) REFERENCES Person (persnr);


ALTER TABLE betreut ADD CONSTRAINT FK_betreut_0 FOREIGN KEY (persnr) REFERENCES Angestellter (persnr);
ALTER TABLE betreut ADD CONSTRAINT FK_betreut_1 FOREIGN KEY (sid) REFERENCES Standort (sid);


ALTER TABLE Mannschaft ADD CONSTRAINT FK_Mannschaft_0 FOREIGN KEY (cheftrainer) REFERENCES Trainer (persnr);
ALTER TABLE Mannschaft ADD CONSTRAINT FK_Mannschaft_1 FOREIGN KEY (asitrainer) REFERENCES Trainer (persnr);


ALTER TABLE Mitglied ADD CONSTRAINT FK_Mitglied_0 FOREIGN KEY (persnr) REFERENCES Person (persnr);


ALTER TABLE Spiel ADD CONSTRAINT FK_Spiel_0 FOREIGN KEY (bezeichnung) REFERENCES Mannschaft (bezeichnung);
ALTER TABLE Spiel ADD CONSTRAINT FK_Spiel_1 FOREIGN KEY (persnr) REFERENCES Spieler (persnr);


ALTER TABLE spielt in ADD CONSTRAINT FK_spielt in_0 FOREIGN KEY (persnr) REFERENCES Spieler (persnr);
ALTER TABLE spielt in ADD CONSTRAINT FK_spielt in_1 FOREIGN KEY (bezeichnung) REFERENCES Mannschaft (bezeichnung);


ALTER TABLE Fanclub ADD CONSTRAINT FK_Fanclub_0 FOREIGN KEY (sid) REFERENCES Standort (sid);
ALTER TABLE Fanclub ADD CONSTRAINT FK_Fanclub_1 FOREIGN KEY (obmann,nummer,bezeichnung) REFERENCES spielt in (persnr,nummer,bezeichnung);


