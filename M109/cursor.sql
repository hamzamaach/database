DROP PROCEDURE IF EXISTS AffProfPlus20;
DELIMITER &&
CREATE PROCEDURE AffProfPlus20()
BEGIN
    declare idProfesseurV int;
    DECLARE cur_points_prof
        CURSOR FOR
        SELECT idProfesseur
        FROM `professeur` p;
    open cur_points_prof;
    boucle_parcours_professeurs :
    LOOP
        fetch cur_points_prof into idProfesseurV;
        if nombrePoint(idProfesseurV) >= 20 then
            leave boucle_parcours_professeurs ;
        end if;
    end loop boucle_parcours_professeurs;
    close cur_points_prof ;
END &&

call EFF2014_V1_1.AffProfPlus20 ;
