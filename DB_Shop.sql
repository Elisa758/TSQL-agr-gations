--CREATE DATABASE Shop;
USE Shop;

CREATE TABLE Categorie(
idCat INT PRIMARY KEY IDENTITY(1,1),
nameCat VARCHAR(30)
);

CREATE TABLE Produit(
idPro INT PRIMARY KEY IDENTITY(1,1),
namePro VARCHAR(30),
prix DECIMAL(10,2),
id_categorie INT NOT NULL,
CONSTRAINT fk_categorie FOREIGN KEY (id_categorie) 
REFERENCES Categorie(idCat)
ON DELETE CASCADE,
);

CREATE TABLE Achat(
idAchat INT PRIMARY KEY IDENTITY(1,1),
id_produit INT NOT NULL,
id_cat INT NOT NULL,
dateAchat DATE NOT NULL,
CONSTRAINT fk_produitAchete FOREIGN KEY (id_produit) 
REFERENCES Produit(idPro),
CONSTRAINT fk_categorieAchete FOREIGN KEY (id_cat) 
REFERENCES Categorie(idCat)
);

INSERT INTO Categorie(nameCat)
VALUES ('peluche'),
('livre'),
('film');

INSERT INTO Produit(namePro,prix,id_categorie)
VALUES ('Krokmou', 15, 1),
('Loup',20,1),
('Niffler',10,1),
('Mercy Thompson',7,2),
('Harry potter',7,2),
('L''assassin royal',7,2),
('Captain America : Civil War', 20,3),
('Spider-Man', 20, 3),
('Detective Pikachu',20,3);

INSERT INTO Achat(id_produit, id_cat, dateAchat)
VALUES 
(1,1, '20190510'),
(2,1, '20191010'),
(3,1, '20191212'),
(1,1, '20200110'),
(2,1, '20200510'),
(3,1, '20200301'),
(4,2, '20190510'),
(5,2, '20190101'),
(6,2, '20190510'),
(4,2, '20200212'),
(5,2, '20200110'),
(6,2, '20200209'),
(7,3, '20191210'),
(8,3,'20190709'),
(9,3, '20190606'),
(7,3,'20200208'),
(8,3, '20200104'),
(9,3, '20200210');

SELECT * FROM Achat;

SELECT Categorie.nameCat, COUNT(Categorie.idCat) AS NombreAchat, SUM(Produit.prix) AS SommeProduit
FROM Achat
INNER JOIN Categorie ON Categorie.idCat=Achat.id_cat
INNER JOIN Produit ON Produit.idPro=Achat.id_produit
GROUP BY Categorie.nameCat;

SELECT COUNT(Categorie.idCat) AS NombreAchat
FROM Achat
INNER JOIN Categorie ON Categorie.idCat=Achat.id_cat
WHERE Achat.dateAchat <= '20201231'
AND Achat.dateAchat >='20190101'
