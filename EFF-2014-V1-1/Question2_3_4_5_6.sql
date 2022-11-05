-- Qustion 2
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
SET nombreAnnees = year(CURDATE())-year(dateAffectation);
SET nombreEnfants = (SELECT nEnfants FROM professeur WHERE idProfesseur = id);
SET nombrePoint = nombreEnfants + nombreAnnees * 2;

RETURN nombrePoint;
END && 


-- DROP FUNCTION IF EXISTS
--     nombrePoint;
-- DELIMITER
--     &&
-- CREATE FUNCTION nombrePoint(id INT) RETURNS INT BEGIN
--     DECLARE
--         nombrePoint INT ;
--     DECLARE dateAffectation date;
--     SET dateAffectation = (
--         SELECT dateAffLycee FROM professeur 
--         WHERE idProfesseur = id);
--     SET nombrePoint = (
--         SELECT nEnfants
--         FROM professeur WHERE idProfesseur = id ) +
--         (YEAR(CURDATE() - YEAR(dateAffectation)) * 2 ; 
--         RETURN nombrePoint ;
--     END &&




--
---------------------------------------------------------



-- Qustion 3
---------------------------------------------------------
--
--
---------------------------------------------------------



-- Qustion 4
---------------------------------------------------------
--
--
---------------------------------------------------------



-- Qustion 5
---------------------------------------------------------
--
--
---------------------------------------------------------



-- Qustion 6
---------------------------------------------------------
--
--
---------------------------------------------------------