-- 3.3 - Gérer les vues
-- Créez une vue correspondant à la jointure Produits - Fournisseurs
CREATE VIEW join_p_f
AS
SELECT * FROM produits p
JOIN fournisseurs f ON f.Id_fournisseurs = p.Id_fournisseurs_pro
