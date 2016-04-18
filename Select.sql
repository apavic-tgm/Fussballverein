-- S1)
SELECT sid, name FROM betreut
WHERE persnr = 11
AND NOT CURRENT_DATE BETWEEN Betreuen.anfang AND Betreuen.ende;

-- S2)
SELECT Person.nname, Person.persnr FROM Betreuen Natural Join person
WHERE CURRENT_DATE BETWEEN Betreuen.anfang AND Betreuen.ende;

-- S3)
SELECT Spiel.mannschaft, Spiel.datum, Person.vname, Person.nname, Spiel.dauer
FROM Spiel NATURAL JOIN Person
WHERE (SELECT EXTRACT(YEAR FROM Spiel.datum))=2015;

-- S6)
CREATE VIEW Trainer_view AS SELECT Person.persnr, Person.vname, Person.nname, Person.geschlecht, Person.gebdat, Trainer.gehalt, Trainer.von,
Trainer.bis FROM Trainer NATURAL JOIN Person;

DROP VIEW Trainer_view;
