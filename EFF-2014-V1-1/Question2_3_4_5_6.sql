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

DROP PROCEDURE IF EXISTS AffLyceePlusDemende;
DELIMITER &&
CREATE PROCEDURE AffLyceePlusDemende(IN `idRegionV` INT, OUT `LyceeMax` VARCHAR(20))
BEGIN 
    DECLARE idLyceeMax int ;
    SET idLyceeMax =(
                    SELECT dd.idLycee 
                    FROM Detail_Demande dd 
                    WHERE idLycee IN(
                        SELECT l.idLycee 
                        FROM Lycee l 
                        INNER JOIN Academie a
                        ON a.idAcademie = l.idAcademie
                        INNER JOIN Region r 
                        ON r.idRegion = a.idRegion
                        WHERE r.idRegion = idRegionV
                    )
                    GROUP BY idLycee
                    ORDER BY COUNT(idLycee)
                    DESC LIMIT 1
                );
    SET LyceeMax = (
                    SELECT nomLycee 
                    FROM Lycee 
                    WHERE idLycee = idLyceeMax
                );
END &&

-- Qustion 5
---------------------------------------------------------
--


DROP PROCEDURE IF EXISTS AffDemendeDiffRegion;
DELIMITER &&
CREATE PROCEDURE AffDemendeDiffRegion()
BEGIN 
    SET professeur =(
                        SELECT
                    idProfesseur
                FROM
                    professeur
                WHERE
                    idProfesseur IN(
                    SELECT
                        l.idLycee
                    FROM
                        professeur p
                    INNER JOIN Lycee l ON
                        p.idLycee = l.idLycee
                    INNER JOIN Academie a ON
                        a.idAcademie = l.idAcademie
                    INNER JOIN Region r ON
                        r.idRegion = a.idRegion
                );
        
END &&


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
    IF NEW.EtatCivil = "celebataire" 
    AND NEW.NEnfants > 0 
    THEN SIGNAL SQLSTATE '50001' 
    SET MESSAGE_TEXT ="Le professeur qu'est celebataire ne peut pas avoir des enfants" ;
	END IF;&&


--
---------------------------------------------------------