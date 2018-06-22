
-- PREMIERE PARTIE --

CREATE SCHEMA gafam;

CREATE TABLE Employe (
numeroEmploye int,
nomEmploye varchar(45),
poste varchar(45),
dateEmbauche date,
salaire int,
service varchar(45),
CONSTRAINT pk_employe PRIMARY KEY (numeroEmploye)
)
COMMENT 'Données des employés', ENGINE InnoDB;

INSERT INTO Employe VALUES (7369, 'SMITH', 'DEVELOPPEUR', '1981-12-17', 2800, 'SOUS DIRECTION A');
INSERT INTO Employe VALUES (7499, 'ALLEN', 'VENDEUR', '1990-01-20', 1600, 'DIRECTION GENERALE');
INSERT INTO Employe VALUES (7521, 'WARD', 'VENDEUR', '2000-02-22', 1250, 'DIRECTION GENERALE');
INSERT INTO Employe VALUES (7566, 'JONES', 'MANAGER', '2001-06-29', 2975, 'SOUS DIRECTION A');
INSERT INTO Employe VALUES (7654, 'MARTIN', 'VENDEUR', '1991-12-28', 1250, 'SOUS DIRECTION B');
INSERT INTO Employe VALUES (7698, 'BLAKE', 'TESTEUR', '2002-05-20', 2850, 'SOUS DIRECTION A');
INSERT INTO Employe VALUES (7782, 'CLARK', 'MANAGER', '2005-08-29', 2450, 'SOUS DIRECTION B');
INSERT INTO Employe VALUES (7788, 'SCOTT', 'ANALYSTE', '2014-08-10', 3000, 'SOUS DIRECTION A');
INSERT INTO Employe VALUES (7839, 'KING', 'PRESIDENT', '1981-11-17', 5000, 'DIRECTION GENERALE');
INSERT INTO Employe VALUES (7844, 'TURNER', 'VENDEUR', '2007-08-09', 1500, 'SOUS DIRECTION A');
INSERT INTO Employe VALUES (7876, 'ADAMS', 'DEVELOPPEUR', '1987-09-23', 2000, 'SOUS DIRECTION B');
INSERT INTO Employe VALUES (7900, 'JAMES', 'DEVELOPPEUR', '2007-06-29', 1950, 'SOUS DIRECTION A');
INSERT INTO Employe VALUES (7902, 'FORD', 'ANALYSTE', '2015-01-03', 3000, 'DIRECTION GENERALE');
INSERT INTO Employe VALUES (7934, 'MILLER', 'DEVELOPPEUR', '1982-01-23', 1300, 'SOUS DIRECTION B');


-- DEUXIEME PARTIE --

SELECT poste
FROM Employe;

SELECT DISTINCT poste 
FROM Employe;

SELECT numeroEmploye, nomEmploye
FROM Employe
WHERE service = 'DIRECTION GENERALE';

SELECT COUNT(numeroEmploye) AS nombreEmploye
FROM Employe;

SELECT service, COUNT(numeroEmploye)
FROM Employe
GROUP BY service;

SELECT nomEmploye
FROM Employe
WHERE salaire >= 2000;

SELECT COUNT(numeroEmploye) AS nombreEmployeSup2000
FROM Employe
WHERE salaire >= 2000;


-- TROISIEME PARTIE --

SELECT nomEmploye, dateEmbauche
FROM Employe;

SELECT DATEDIFF(NOW(), dateEmbauche) DIV 365 AS anciennete
FROM Employe;

SELECT *, DATEDIFF(NOW(), dateEmbauche) DIV 365 AS anciennete
FROM Employe
ORDER BY nomEmploye ASC, anciennete DESC;

SELECT nomEmploye, salaire
FROM Employe
ORDER BY salaire DESC;

SELECT nomEmploye
FROM Employe
WHERE salaire >= (SELECT AVG(salaire) AS moyenne
					FROM Employe);
                    
SELECT MIN(salaire) AS lePlusBas
FROM Employe;

SELECT MAX(salaire) AS lePlusHaut
FROM Employe;


-- QUATRIEME PARTIE --

SELECT *
FROM Employe
WHERE MONTH(dateEmbauche) = MOD(MONTH(NOW()) + 1, 12);

SELECT *
FROM Employe
WHERE nomEmploye LIKE 'M%';

SELECT *
FROM Employe
WHERE poste LIKE '%Y%';

SELECT *
FROM Employe
WHERE nomEmploye LIKE '%ER';

SELECT *
FROM Employe
WHERE LENGTH(nomEmploye) = 5;