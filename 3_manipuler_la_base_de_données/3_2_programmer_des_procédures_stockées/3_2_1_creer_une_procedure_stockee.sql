-- 3.2.1 - Créez une procédure stockée qui renvoi le délai moyen entre la date de commande et la date de facturation

DELIMITER $$

CREATE PROCEDURE DelaiMoyen()
BEGIN
    DECLARE Delai_Moyen INT DEFAULT 0;

SELECT AVG(DATEDIFF(com_facture_date, com_com_date))
INTO  Delai_Moyen
FROM commandes;

SELECT  Delai_Moyen;
END $$

DELIMITER ;

CALL DelaiMoyen();

------------------------------

DELIMITER |

CREATE PROCEDURE delaiMoye(out result INT)

BEGIN
set result =null;
SELECT ROUND(AVG(DATEDIFF(    com_facture_date,    com_com_date ))) AS Delai
FROM commandes;


END |

DELIMITER ;

CALL delaiMoye(@result);


