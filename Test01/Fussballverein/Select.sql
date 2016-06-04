-- S1)
-- die benötigten Datensätze von der Tabelle betreut werden angezeigt, wenn das Datum stimmt
SELECT sid, name FROM betreut
WHERE persnr = 11
AND NOT CURRENT_DATE BETWEEN Betreuen.anfang AND Betreuen.ende;

-- S2)
-- mithilfe von NATURAL JOIN können auch Datensätze von einer anderen Tabelle abgerufen werden
SELECT Person.nname, Person.persnr FROM Betreuen Natural Join person
WHERE CURRENT_DATE BETWEEN Betreuen.anfang AND Betreuen.ende;

-- S3)
-- mithilfe von NATURAL JOIN können auch Datensätze von einer anderen Tabelle abgerufen werden
SELECT Spiel.mannschaft, Spiel.datum, Person.vname, Person.nname, Spiel.dauer
FROM Spiel NATURAL JOIN Person
WHERE (SELECT EXTRACT(YEAR FROM Spiel.datum))=2015;

-- S6)
-- ein neuer View wird erstellt um Datensätze von Trainer und Person immer wieder einfach abrufen zu können
CREATE VIEW Trainer_view AS SELECT Person.persnr, Person.vname, Person.nname, Person.geschlecht, Person.gebdat, Trainer.gehalt, Trainer.von,
Trainer.bis FROM Trainer NATURAL JOIN Person;

-- die View wird nicht mehr benutzt und gelöscht
DROP VIEW Trainer_view;
