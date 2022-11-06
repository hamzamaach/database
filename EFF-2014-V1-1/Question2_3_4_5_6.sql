-- Qustion 2
---------------------------------------------------------
--


--
---------------------------------------------------------



-- Qustion 3
---------------------------------------------------------
--
DROP FUNCTION IF EXISTS nombrePoint;
DELIMITER &&
CREATE FUNCTION nombrePoint(id int)
RETURNS int
BEGIN
DECLARE dateAffectation date;
DECLARE nombreAnnees int;
DECLARE nombreEnfants int;
DECLARE nombrePoint int;

SET dateAffectation = (SELECT dateAffLycee FROM professeur WHERE idProfesseur = id);
SET nombreEnfants = (SELECT nEnfants FROM professeur WHERE idProfesseur = id);
SET nombreAnnees = year(CURDATE())-year(dateAffectation);
SET nombrePoint = nombreEnfants + nombreAnnees * 2;

RETURN nombrePoint;
END && 


--
---------------------------------------------------------



-- Qustion 4
---------------------------------------------------------
--
--
---------------------------------------------------------

DROP PROCEDURE IF EXISTS AffLycee;
DELIMITER &&
CREATE PROCEDURE AffLycee(id int)
BEGIN 



SELECT Ville FROM Lycee WHERE idLycee = id;




END

-- Qustion 5
---------------------------------------------------------
--
--
---------------------------------------------------------



-- Qustion 6
---------------------------------------------------------
--


DROP TRIGGER IF EXISTS Celeb;
DELIMITER &&
CREATE TRIGGER `Celeb` 
BEFORE 
INSERT ON professeur
FOR EACH ROW 
    IF NEW.EtatCivil = "celebataire" AND NEW.NEnfants > 0 
    THEN SIGNAL SQLSTATE '50001' 
    SET MESSAGE_TEXT ="Le professeur qu'est celebataire ne peut pas avoir des enfants" ;
	END IF;&&


--
---------------------------------------------------------