SELECT * 
FROM sites_miniers

INSERT INTO employes (nom, poste, salaire, id_site) VALUES
('Traoré Moussa', 'Ingénieur', 1200000, 1),
('Diallo Aminata', 'Technicien', 600000, 1),
('Coulibaly Issa', 'Opérateur', 400000, 1),

('Keita Fatoumata', 'Ingénieur', 1300000, 2),
('Sangaré Oumar', 'Technicien', 650000, 2),
('Diarra Boubacar', 'Opérateur', 420000, 2),

('Koné Mariam', 'Ingénieur', 1250000, 3),
('Camara Ibrahim', 'Technicien', 700000, 3),
('Maiga Ali', 'Opérateur', 450000, 3),

('Sidibé Awa', 'Ingénieur', 1350000, 4),
('Touré Abdoulaye', 'Technicien', 680000, 4),
('Sanogo Yaya', 'Opérateur', 430000, 4),

('Bagayoko Salif', 'Ingénieur', 1400000, 5),
('Coulibaly Aissata', 'Technicien', 720000, 5),
('Traoré Ousmane', 'Opérateur', 500000, 5);

-- SELECT* FROM employes

INSERT INTO productions (id_site, date_production, quantite_tonnes) VALUES
(1, '2024-01-01', 50),
(1, '2024-02-01', 55),
(1, '2024-03-01', 60),

(2, '2024-01-01', 80),
(2, '2024-02-01', 75),
(2, '2024-03-01', 90),

(3, '2024-01-01', 100),
(3, '2024-02-01', 95),
(3, '2024-03-01', 110),

(4, '2024-01-01', 70),
(4, '2024-02-01', 65),
(4, '2024-03-01', 85),

(5, '2024-01-01', 40),
(5, '2024-02-01', 45),
(5, '2024-03-01', 50);

SELECT * FROM productions

INSERT INTO ventes (id_production, prix_par_tonne, quantite_vendue) VALUES
(1, 60000, 45),
(2, 61000, 50),
(3, 62000, 55),

(4, 60000, 70),
(5, 61000, 65),
(6, 62000, 80),

(7, 60000, 90),
(8, 61000, 85),
(9, 62000, 100),

(10, 60000, 60),
(11, 61000, 55),
(12, 62000, 75),

(13, 30000, 35),
(14, 31000, 40),
(15, 32000, 45);

-- SELECT * FROM ventes 

--💰 1. Quel site produit le plus ? 
SELECT id_site, SUM(quantite_tonnes) as Total
from productions 
GROUP BY id_site 
ORDER BY Total DESC

--2-Salaire moyen par site 
select id_site , avg(salaire) as salaire_moyen  
from employes
GROUP BY id_site

--3. Top production mensuelle
SELECT *
from productions  
ORDER BY quantite_tonnes DESC
limit 3

-- 4. Revenu par vente 
SELECT id_vente ,   prix_par_tonne * quantite_vendue as  REVENU 
FROM ventes 

--PROCHAINE ÉTAPE (LE GAME CHANGER)

--Voir les productions avec le nom du site
SELECT s.nom_site, p.date_production, p.quantite_tonnes 
from productions p 
join sites_miniers s  
on p.id_site = s.id_site;

--Quel site produit le plus ? 
SELECT s.nom_site,  sum(p.quantite_tonnes) as total_production
from productions p
join sites_miniers s  
on  s.id_site = p.id_site
GROUP BY s.nom_site 
ORDER BY total_production DESC  
 
-- Liste des employés avec leur site  
SELECT s.nom_site, e.nom, e.id_site
from employes e
join sites_miniers s on  s.id_site = e.id_site 

--JOIN + agrégation 
--Nombre d’employés par site  
SELECT s.nom_site, count(*) as nb_employes 
from employes e  
join sites_miniers s 
on e.id_site = s.id_site 
GROUP BY s.nom_site

--Revenu par site 

SELECT s.nom_site,
       SUM(v.prix_par_tonne * v.quantite_vendue) AS revenu_total
FROM ventes v
JOIN productions p ON v.id_production = p.id_production
JOIN sites_miniers s ON p.id_site = s.id_site
GROUP BY s.nom_site
ORDER BY revenu_total DESC;  

--Employés du site "Morila  
SELECT e.nom, e.poste
from employes e 
join sites_miniers s on e.id_site = s.id_site
where s.nom_site  = 'Morila' 
