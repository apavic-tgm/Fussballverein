-- df position: word=position.list
-- df vname: word=vname.list
-- df nname: word=nname.list
-- df lpost: word=plz.list
-- df land: word=laender.list
-- df ort: word=stadt.list


CREATE TABLE Person ( -- df: mult=1.0
 persnr INT NOT NULL, -- df: count
 vname VARCHAR(15) NOT NULL, -- df: text=vname length=1
 nname VARCHAR(15) NOT NULL, -- df: text=nname length=1
 geschlecht CHAR(1) NOT NULL, -- df: pattern='(M|W|N)'
 gebdat DATE NOT NULL -- df: date
);

ALTER TABLE Person ADD CONSTRAINT PK_Person PRIMARY KEY (persnr);
ALTER TABLE Person ADD CONSTRAINT geschl CHECK (geschlecht= 'M' OR geschlecht= 'W' OR geschlecht= 'N');

CREATE TABLE Spieler ( -- df: mult=1.0
 persnr INT NOT NULL,
 gehalt DECIMAL(10) NOT NULL, -- df: pattern='[1-9]{3,5}'
 position VARCHAR(30) NOT NULL, -- df: text=position length=1
 von DATE NOT NULL, -- df: date
 bis DATE NOT NULL -- df: date
);

ALTER TABLE Spieler ADD CONSTRAINT PK_Spieler PRIMARY KEY (persnr);


CREATE TABLE Standort ( -- df: mult=1.0
 sid INT NOT NULL, -- df: count
 land VARCHAR(50) NOT NULL, -- df: text=land length=1
 plz INT NOT NULL, -- df: text=lpost length=1
 ort VARCHAR(20) NOT NULL -- df: text=ort length=1
);

ALTER TABLE Standort ADD CONSTRAINT PK_Standort PRIMARY KEY (sid);
ALTER TABLE Standort ADD CONSTRAINT sid CHECK (sid > 0);

CREATE TABLE Trainer( -- df: mult=1.0
 persnr INT NOT NULL,
 gehalt DECIMAL(10) NOT NULL, -- df: pattern='[1-9]{3,5}'
 von DATE NOT NULL, -- df: date
 bis DATE NOT NULL -- df: date
);

ALTER TABLE Trainer ADD CONSTRAINT PK_Trainer PRIMARY KEY (persnr);


CREATE TABLE Angestellter ( -- df: mult=1.0
 persnr INT NOT NULL,
 gehalt DECIMAL(10) NOT NULL, -- df: pattern='[1-9]{3,5}'
 ueberstunden DECIMAL(3) NOT NULL, -- df: pattern='[1-9]{3}'
 e_mail VARCHAR(60) NOT NULL -- df: pattern='[a-z]{10}@[a-z]{6}.com'
);

ALTER TABLE Angestellter ADD CONSTRAINT PK_Angestellter PRIMARY KEY (persnr);


CREATE TABLE Mannschaft ( -- df: mult=1.0
 bezeichnung VARCHAR(50) NOT NULL, -- df: pattern='[A-Z]{10}'
 klasse VARCHAR(10) NOT NULL, -- df: pattern='[A-Z]{10}'
 naechstes_spiel DATE NOT NULL, -- df: date
 chef_trainer INT NOT NULL UNIQUE,
 kapitaen INT NOT NULL,
 assisstent INT NOT NULL UNIQUE
);

ALTER TABLE Mannschaft ADD CONSTRAINT PK_Mannschaft PRIMARY KEY (bezeichnung);


CREATE TABLE Mitglied ( -- df: mult=1.0
 persnr INT NOT NULL,
 beitrag DECIMAL(10) NOT NULL -- df: pattern='[1-9]{3,5}'
);

ALTER TABLE Mitglied ADD CONSTRAINT PK_Mitglied PRIMARY KEY (persnr);


CREATE TABLE Spiel ( -- df: mult=1.0
 Datum TIMESTAMP(6) NOT NULL, -- df: date
 bezeichnung VARCHAR(50) NOT NULL, -- df: pattern='[A-Z]{10}'
 persnr INT NOT NULL,
 gegner VARCHAR(20) NOT NULL, -- df: pattern='[A-Z]{10}'
 ergebnis VARCHAR(20) NOT NULL, -- df: pattern='(Sieg|Niederlage|Unentschieden)'
 dauer DECIMAL(2,2) NOT NULL -- df: pattern='[1-9]{2}'
);

ALTER TABLE Spiel ADD CONSTRAINT PK_Spiel PRIMARY KEY (Datum,bezeichnung,persnr);
ALTER TABLE Spiel ADD CONSTRAINT erg_eingabe CHECK (ergebnis = 'Sieg' OR ergebnis = 'Unentschieden' OR ergebnis = 'Niederlage');


CREATE TABLE Spieltin ( -- df: mult=1.0
 nummer INT NOT NULL, -- df: pattern='[1-99]{1}'
 bezeichnung VARCHAR(50) NOT NULL, -- df: pattern='[A-Z]{10}'
 persnr INT NOT NULL
);

ALTER TABLE Spieltin ADD CONSTRAINT PK_Spieltin PRIMARY KEY (nummer,bezeichnung);
ALTER TABLE Spieltin ADD CONSTRAINT nummerauswahl CHECK (nummer >= 1 AND nummer <= 99);


CREATE TABLE Fanclub (
 sid INT NOT NULL,
 name VARCHAR(50) NOT NULL,
 gegruendet DATE NOT NULL,
 obmann INT NOT NULL UNIQUE
);

ALTER TABLE Fanclub ADD CONSTRAINT PK_Fanclub PRIMARY KEY (sid,name);


CREATE TABLE Betreuen (
 sid INT NOT NULL,
 name VARCHAR(50) NOT NULL,
 persnr INT NOT NULL,
 anfang DATE NOT NULL,
 ende DATE NOT NULL
);

ALTER TABLE Betreuen ADD CONSTRAINT PK_Betreuen PRIMARY KEY (sid,name,persnr);


ALTER TABLE Spieler ADD CONSTRAINT FK_Spieler_0 FOREIGN KEY (persnr) REFERENCES Person (persnr);


ALTER TABLE Trainer ADD CONSTRAINT FK_Trainer_0 FOREIGN KEY (persnr) REFERENCES Person (persnr);


ALTER TABLE Angestellter ADD CONSTRAINT FK_Angestellter_0 FOREIGN KEY (persnr) REFERENCES Person (persnr);


ALTER TABLE Mannschaft ADD CONSTRAINT FK_Mannschaft_0 FOREIGN KEY (assisstent) REFERENCES Spieler (persnr);
ALTER TABLE Mannschaft ADD CONSTRAINT FK_Mannschaft_1 FOREIGN KEY (chef_trainer) REFERENCES Trainer (persnr);
ALTER TABLE Mannschaft ADD CONSTRAINT FK_Mannschaft_2 FOREIGN KEY (kapitaen) REFERENCES Trainer (persnr);


ALTER TABLE Mitglied ADD CONSTRAINT FK_Mitglied_0 FOREIGN KEY (persnr) REFERENCES Person (persnr);


ALTER TABLE Spiel ADD CONSTRAINT FK_Spiel_0 FOREIGN KEY (bezeichnung) REFERENCES Mannschaft (bezeichnung);
ALTER TABLE Spiel ADD CONSTRAINT FK_Spiel_1 FOREIGN KEY (persnr) REFERENCES Spieler (persnr);


ALTER TABLE Spieltin ADD CONSTRAINT FK_Spieltin_0 FOREIGN KEY (bezeichnung) REFERENCES Mannschaft (bezeichnung);
ALTER TABLE Spieltin ADD CONSTRAINT FK_Spieltin_1 FOREIGN KEY (persnr) REFERENCES Spieler (persnr);


ALTER TABLE Fanclub ADD CONSTRAINT FK_Fanclub_0 FOREIGN KEY (sid) REFERENCES Standort (sid);
ALTER TABLE Fanclub ADD CONSTRAINT FK_Fanclub_1 FOREIGN KEY (obmann) REFERENCES Mitglied (persnr);


ALTER TABLE Betreuen ADD CONSTRAINT FK_Betreuen_0 FOREIGN KEY (sid,name) REFERENCES Fanclub (sid,name);
ALTER TABLE Betreuen ADD CONSTRAINT FK_Betreuen_1 FOREIGN KEY (persnr) REFERENCES Angestellter (persnr);
