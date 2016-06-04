-- df position: word=position.list
-- df vname: word=vname.list
-- df nname: word=nname.list
-- df lpost: word=plz.list
-- df land: word=laender.list
-- df ort: word=stadt.list


CREATE TABLE Person ( -- df: mult=6100.0
 persnr SERIAL NOT NULL, -- df: offset=10000 shift=0 step=2 size=9999999999
 vname VARCHAR(15) NOT NULL, -- df: text=vname length=1
 nname VARCHAR(15) NOT NULL, -- df: text=nname length=1
 geschlecht CHAR(1) NOT NULL, -- df: pattern='(M|W|N)'
 gebdat DATE NOT NULL -- df: start=1900-01-01 end=2006-01-01
);

ALTER SEQUENCE persnr INCREMENT BY 2 START 10000;
ALTER TABLE Person ADD CONSTRAINT PK_Person PRIMARY KEY (persnr);
ALTER TABLE Person ADD CONSTRAINT geschl CHECK (geschlecht= 'M' OR geschlecht= 'W' OR geschlecht= 'N');



CREATE TABLE Spieler ( -- df: mult=2000.00
 persnr SERIAL NOT NULL, -- df: offset=10000 shift=0 step=2 size=9999999999
 gehalt DECIMAL(10) NOT NULL, -- df: pattern='[1-9]{10}'
 position VARCHAR(30) NOT NULL, -- df: text=position length=1
 von DATE NOT NULL, -- df: start=1900-01-01 end=1950-01-01
 bis DATE NOT NULL -- df: start=1950-01-01  end=2006-01-01
);

ALTER SEQUENCE persnr INCREMENT BY 2 START 10000;
ALTER TABLE Spieler ADD CONSTRAINT PK_Spieler PRIMARY KEY (persnr);



CREATE TABLE Standort ( -- df: mult=1000.0
 sid SERIAL NOT NULL, -- df: offset=0 shift=0 step=1 size=99999
 land VARCHAR(50) NOT NULL, -- df: text=land length=1
 plz INT NOT NULL, -- df: text=lpost length=1
 ort VARCHAR(20) NOT NULL -- df: text=ort length=1
);

ALTER TABLE Standort ADD CONSTRAINT PK_Standort PRIMARY KEY (sid);
ALTER TABLE Standort ADD CONSTRAINT sid CHECK (sid > 0);


CREATE TABLE Trainer( -- df: mult=2000.00
 persnr SERIAL NOT NULL, -- df: offset=210000 shift=0 step=1 size=9999999999
 gehalt DECIMAL(10) NOT NULL, -- df: pattern='[1-9]{10}'
 von DATE NOT NULL, -- df: start=1900-01-01 end=1950-01-01
 bis DATE NOT NULL -- df: start=1950-01-01  end=2006-01-01
);

ALTER TABLE Trainer ADD CONSTRAINT PK_Trainer PRIMARY KEY (persnr);


CREATE TABLE Angestellter ( -- df: mult=2000.00
 persnr SERIAL NOT NULL, -- df: offset=410000 shift=0 step=2 size=9999999999
 gehalt DECIMAL(10) NOT NULL, -- df: pattern='[1-9]{10}'
 ueberstunden DECIMAL(3) NOT NULL, -- df: pattern='[1-9]{3}'
 e_mail VARCHAR(60) NOT NULL -- df: pattern='[a-z]{10}@"hotmail.com"'
);

ALTER TABLE Angestellter ADD CONSTRAINT PK_Angestellter PRIMARY KEY (persnr);

CREATE TABLE Mannschaft ( -- df: mult=1000.0
 bezeichnung VARCHAR(50) NOT NULL, -- df: pattern='Mannschaft.[:count:]'
 klasse VARCHAR(10) NOT NULL, -- df:
 naechstes_spiel DATE NOT NULL, -- df: date
 chef_trainer INT NOT NULL REFERENCES UNIQUE, -- df:offset=210000 shift=0 step=2 size=9999999999
 kapitaen INT NOT NULL REFERENCES UNIQUE, -- df:offset=11000 shift=0 step=2 size=999999999999
 assisstent INT NOT NULL REFERENCES UNIQUE -- df:offset=310000 shift=0 step=1 size=9999999999
);

ALTER TABLE Mannschaft ADD CONSTRAINT PK_Mannschaft PRIMARY KEY (bezeichnung);


CREATE TABLE Mitglied ( -- df: mult=2000.00
 persnr INT NOT NULL, -- df:offset=510000 shift=0 step=1 size=999999999
 beitrag DECIMAL(10) NOT NULL -- df: pattern='[1-9]{3}'
);

ALTER TABLE Mitglied ADD CONSTRAINT PK_Mitglied PRIMARY KEY (persnr);


CREATE TABLE Spiel (
 Datum TIMESTAMP(6) NOT NULL, -- df: timestamp
 bezeichnung VARCHAR(50) NOT NULL, -- df: pattern='Spiel.[:count:]'
 persnr SERIAL NOT NULL, -- df: offset=10000 shift=0 step=2 size=9999999999
 gegner VARCHAR(20) NOT NULL, -- df: pattern='Mannschaft.[:count:]'
 ergebnis VARCHAR(20) NOT NULL, -- df: pattern='[1-9]{2}'
 dauer DECIMAL(2,2) NOT NULL -- df: pattern='[1-9]{4}'
);

ALTER TABLE Spiel ADD CONSTRAINT PK_Spiel PRIMARY KEY (Datum,bezeichnung,persnr);
ALTER TABLE Spiel ADD CONSTRAINT erg_eingabe CHECK (ergebnis = 'Sieg' OR ergebnis = 'Unentschieden' OR ergebnis = 'Niederlage');


CREATE TABLE Spieltin (
 nummer INT NOT NULL, -- df: count
 bezeichnung VARCHAR(50) NOT NULL, -- df: pattern='Mannschaft.[:count:]'
 persnr INT NOT NULL -- df: offset=10000 shift=0 step=2 size=9999999999
);

ALTER TABLE Spieltin ADD CONSTRAINT PK_Spieltin PRIMARY KEY (nummer,bezeichnung);
ALTER TABLE Spieltin ADD CONSTRAINT nummerauswahl CHECK (nummer >= 1 AND nummer <= 99);


CREATE TABLE Fanclub (
 sid INT NOT NULL, -- df: count
 name VARCHAR(50) NOT NULL, -- df: pattern='Fanclub.[:count:]'
 gegruendet DATE NOT NULL, -- df: date
 obmann INT NOT NULL UNIQUE -- df:offset=510000 shift=0 step=1 size=999999999
);

ALTER TABLE Fanclub ADD CONSTRAINT PK_Fanclub PRIMARY KEY (sid,name);


CREATE TABLE Betreuen (
 sid INT NOT NULL, -- df: count
 name VARCHAR(50) NOT NULL, -- df: pattern='Fanclub.[:count:]'
 persnr INT NOT NULL, -- df: offset=410000 shift=0 step=2 size=9999999999
 anfang DATE NOT NULL, -- df: date
 ende DATE NOT NULL -- df: date
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
