CREATE TABLE Person (
 persnr INT NOT NULL,
 vname VARCHAR(15) NOT NULL,
 nname VARCHAR(15) NOT NULL,
 geschlecht CHAR(1) NOT NULL,
 gebdat DATE NOT NULL
);

ALTER TABLE Person ADD CONSTRAINT PK_Person PRIMARY KEY (persnr);
ALTER SEQUENCE persnr RESTART WITH 10000 INCREMENT BY 2;


CREATE TABLE Spieler (
 persnr INT NOT NULL,
 gehalt INT NOT NULL,
 position VARCHAR(10) NOT NULL,
 von DATE NOT NULL,
 bis DATE NOT NULL
);

ALTER TABLE Spieler ADD CONSTRAINT PK_Spieler PRIMARY KEY (persnr);


CREATE TABLE Standort (
 sid INT NOT NULL,
 land VARCHAR(20) NOT NULL,
 plz INT NOT NULL,
 ort VARCHAR(20) NOT NULL
);

ALTER TABLE Standort ADD CONSTRAINT PK_Standort PRIMARY KEY (sid);


CREATE TABLE Trainer (
 persnr INT NOT NULL,
 gehalt FLOAT(10) NOT NULL,
 von DATE NOT NULL,
 bis DATE NOT NULL
);

ALTER TABLE Trainer ADD CONSTRAINT PK_Trainer PRIMARY KEY (persnr);


CREATE TABLE Angestellter (
 persnr INT NOT NULL,
 gehalt INT NOT NULL,
 ueberstunden INT NOT NULL,
 e_mail VARCHAR(30) NOT NULL
);

ALTER TABLE Angestellter ADD CONSTRAINT PK_Angestellter PRIMARY KEY (persnr);


CREATE TABLE Mannschaft (
 bezeichnung VARCHAR(50) NOT NULL,
 klasse VARCHAR(10) NOT NULL,
 naechstes_spiel DATE NOT NULL,
 chef_trainer INT NOT NULL,
 kapitaen INT NOT NULL,
 assisstent INT NOT NULL
);

ALTER TABLE Mannschaft ADD CONSTRAINT PK_Mannschaft PRIMARY KEY (bezeichnung);


CREATE TABLE Mitglied (
 persnr INT NOT NULL,
 beitrag CHAR(10) NOT NULL
);

ALTER TABLE Mitglied ADD CONSTRAINT PK_Mitglied PRIMARY KEY (persnr);


CREATE TABLE Spiel (
 Datum TIMESTAMP(10) NOT NULL,
 bezeichnung VARCHAR(50) NOT NULL,
 persnr INT NOT NULL,
 gegner VARCHAR(20) NOT NULL,
 ergebnis VARCHAR(15) NOT NULL,
 dauer FLOAT(200) NOT NULL
);

ALTER TABLE Spiel ADD CONSTRAINT PK_Spiel PRIMARY KEY (Datum,bezeichnung,persnr);


CREATE TABLE spielt in (
 nummer INT NOT NULL,
 bezeichnung VARCHAR(50) NOT NULL,
 persnr INT NOT NULL
);

ALTER TABLE spielt in ADD CONSTRAINT PK_spielt in PRIMARY KEY (nummer,bezeichnung);


CREATE TABLE Fanclub (
 sid INT NOT NULL,
 name VARCHAR(50) NOT NULL,
 gegruendet DATE NOT NULL,
 obmann INT NOT NULL
);

ALTER TABLE Fanclub ADD CONSTRAINT PK_Fanclub PRIMARY KEY (sid,name);


CREATE TABLE betreut (
 sid INT NOT NULL,
 name VARCHAR(50) NOT NULL,
 persnr INT NOT NULL,
 anfang DATE NOT NULL,
 ende DATE NOT NULL
);

ALTER TABLE betreut ADD CONSTRAINT PK_betreut PRIMARY KEY (sid,name,persnr);


ALTER TABLE Spieler ADD CONSTRAINT FK_Spieler_0 FOREIGN KEY (persnr) REFERENCES Person (persnr);


ALTER TABLE Trainer ADD CONSTRAINT FK_Trainer_0 FOREIGN KEY (persnr) REFERENCES Person (persnr);


ALTER TABLE Angestellter ADD CONSTRAINT FK_Angestellter_0 FOREIGN KEY (persnr) REFERENCES Person (persnr);


ALTER TABLE Mannschaft ADD CONSTRAINT FK_Mannschaft_0 FOREIGN KEY (assisstent) REFERENCES Spieler (persnr);
ALTER TABLE Mannschaft ADD CONSTRAINT FK_Mannschaft_1 FOREIGN KEY (chef_trainer) REFERENCES Trainer (persnr);
ALTER TABLE Mannschaft ADD CONSTRAINT FK_Mannschaft_2 FOREIGN KEY (kapitaen) REFERENCES Trainer (persnr);


ALTER TABLE Mitglied ADD CONSTRAINT FK_Mitglied_0 FOREIGN KEY (persnr) REFERENCES Person (persnr);


ALTER TABLE Spiel ADD CONSTRAINT FK_Spiel_0 FOREIGN KEY (bezeichnung) REFERENCES Mannschaft (bezeichnung);
ALTER TABLE Spiel ADD CONSTRAINT FK_Spiel_1 FOREIGN KEY (persnr) REFERENCES Spieler (persnr);


ALTER TABLE spielt in ADD CONSTRAINT FK_spielt in_0 FOREIGN KEY (bezeichnung) REFERENCES Mannschaft (bezeichnung);
ALTER TABLE spielt in ADD CONSTRAINT FK_spielt in_1 FOREIGN KEY (persnr) REFERENCES Spieler (persnr);


ALTER TABLE Fanclub ADD CONSTRAINT FK_Fanclub_0 FOREIGN KEY (sid) REFERENCES Standort (sid);
ALTER TABLE Fanclub ADD CONSTRAINT FK_Fanclub_1 FOREIGN KEY (obmann) REFERENCES Mitglied (persnr);


ALTER TABLE betreut ADD CONSTRAINT FK_betreut_0 FOREIGN KEY (sid,name) REFERENCES Fanclub (sid,name);
ALTER TABLE betreut ADD CONSTRAINT FK_betreut_1 FOREIGN KEY (persnr) REFERENCES Angestellter (persnr);
