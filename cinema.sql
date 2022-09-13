CREATE DATABASE gestion_de_cinema;

USE gestion_de_cinema;

CREATE TABLE Admin
(
    id int UNSIGNED NOT NULL auto_increment, --UNSIGNED valeur non negatif,valeur non nul--
    name varchar(255) NOT NULL,
    pass varchar(255) NOT NULL,
    signindate date NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Client
(
    id int UNSIGNED NOT NULL,
    firstname varchar(255) NOT NULL,
    lastname varchar(255) NOT NULL,
    age tinyint NOT NULL,
    signindate date NOT NULL,
    PRIMARY KEY (signindate)
);

ALTER TABLE Admin
ADD FOREIGN KEY (signindate) REFERENCES Client(signindate);

CREATE TABLE Cinema 
(
    id int UNSIGNED NOT NULL auto_increment,
    name varchar(255) NOT NULL,
    city varchar(255) NOT NULL,
    rooms varchar(255) NOT NULL,
    admin varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Movie 
(
    id int UNSIGNED NOT NULL auto_increment,
    name varchar(255) NOT NULL,
    releaseDate date NOT NULL,
    category varchar(255) NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE Price
(
    id int UNSIGNED NOT NULL auto_increment,
    movieID int NOT NULL,
    type boolean,
    price int,
    PRIMARY KEY (id)
);

CREATE TABLE Room 
(
    id int UNSIGNED NOT NULL auto_increment,
    CinemaID int NOT NULL,
    places smallint NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Seance
(
    id int UNSIGNED NOT NULL auto_increment,
    movieID int NOT NULL,
    CinemaID int NOT NULL,
    Date date NOT NULL,
    Heure time NOT NULL,
    RoomID int NOT NULL,
    PRIMARY KEY (id)
);

/*Insertion données dans les tables*/

SET FOREIGN_KEY_CHECKS=0; --la contrainte foreign key me bloquer pour l'insertion de données ^^--

INSERT INTO Admin ( id, name, pass, signindate)
VALUES ( "1", "bofbof", "onestdaccord", "20220815");

INSERT INTO Client ( id, firstname, lastname, age, signindate)
VALUES ( "1", "Jean", "Dupont", "55", "20220901");

INSERT INTO Cinema ( id, name, city, rooms, admin)
VALUES ( "1", "Les trois clés", "Chartres", "Fraise", "bofbof");

UPDATE Cinema SET name="Les trois cles" WHERE id=1;

INSERT INTO Movie ( id, name, releaseDate, category)
VALUES ( "10", "La ligne verte", "20000301", "Fantastique,Policier");

ALTER TABLE Price
MODIFY type varchar(255) NOT NULL;

INSERT INTO Price ( id, movieID, type, price)
VALUES ( "1", "10", "normal", "5");

ALTER TABLE Price
MODIFY price varchar(255) NOT NULL;

UPDATE Price SET price="5 euros";

INSERT INTO Room ( id, CinemaID, places)
VALUES ( "101", "1", "206");

INSERT INTO Seance ( id, movieID, CinemaID, Date, Heure, RoomID)
VALUES ( "1", "10", "1", "20220902", "003013", "101");

UPDATE Seance SET Heure="133000";

/* Reservation et Order exercice 2 */

CREATE TABLE Reservation
(
    id int UNSIGNED NOT NULL auto_increment,
    orderID int NOT NULL,
    price int NOT NULL,
    seat smallint NOT NULL,
    seanceID int NOT NULL,
    PRIMARY KEY (id)
);

-- FOREIGN KEY (seanceID) REFERENCES Seance(id) < MESSAGE ERROR 1005 (HY000): Can't create table `gestion_de_cinema`.`Reservation` (errno: 150 "Foreign key constraint is incorrectly formed")> <resolution : meme typage>--

CREATE TABLE ordre
(
    id int UNSIGNED NOT NULL auto_increment,
    clientID int NOT NULL,
    total int NOT NULL,
    status varchar(255) NOT NULL,
    purchase_date date NOT NULL,
    PRIMARY KEY (id)
);

-- FOREIGN KEY (clientID) REFERENCES Client(id) < MESSAGE ERROR 1005 (HY000): Can't create table `gestion_de_cinema`.`Reservation` (errno: 150 "Foreign key constraint is incorrectly formed")> <resolution : meme typage>--

/* Ajout primary et foreign key  */

ALTER TABLE table_name
MODIFY COLUMN column_name datatype;

ALTER TABLE Seance 
MODIFY COLUMN RoomID int(10) UNSIGNED;

ALTER TABLE Seance
ADD FOREIGN KEY (RoomID) REFERENCES Room(id);

ALTER TABLE ordre 
MODIFY COLUMN clientID int(10) UNSIGNED;

ALTER TABLE Client
DROP PRIMARY KEY;

ALTER TABLE Client
ADD PRIMARY KEY (id);

ALTER TABLE ordre 
MODIFY COLUMN clientID int(10) UNSIGNED NOT NULL;

INSERT INTO ordre ( id, clientID, total, status, purchase_date)
VALUES ( "1", "1", "5", "order", "20220905");

ALTER TABLE ordre
ADD FOREIGN KEY (clientID) REFERENCES Client(id);

INSERT INTO Reservation ( id, orderID, price, seat, seanceID)
VALUES ( "1", "1", "5", "77", "1");

ALTER TABLE Reservation
MODIFY COLUMN orderID int(10) UNSIGNED NOT NULL;

ALTER TABLE Reservation
MODIFY COLUMN seanceID int(10) UNSIGNED NOT NULL;

ALTER TABLE Reservation
ADD FOREIGN KEY (orderID) REFERENCES ordre(id);

ALTER TABLE Reservation
ADD FOREIGN KEY (seanceID) REFERENCES Seance(id);

ALTER TABLE Price
MODIFY COLUMN movieID int(10) UNSIGNED NOT NULL;

ALTER TABLE Price
ADD FOREIGN KEY (movieID) REFERENCES Movie(id);

UPDATE Cinema
SET admin="1";

ALTER TABLE Cinema
MODIFY COLUMN admin int(10) UNSIGNED NOT NULL;

ALTER TABLE Cinema
ADD FOREIGN KEY (admin) REFERENCES Admin(id);

ALTER TABLE Seance
MODIFY COlUMN movieID int(10) UNSIGNED NOT NULL;

ALTER TABLE Seance
MODIFY COlUMN CinemaID int(10) UNSIGNED NOT NULL;

ALTER TABLE Seance
ADD FOREIGN KEY (movieID) REFERENCES Movie(id);

ALTER TABLE Seance
ADD FOREIGN KEY (CinemaID) REFERENCES Cinema(id);

ALTER TABLE Admin
RENAME administrator;

/* Exo : creation d'index entre deux tables (colonne) */

/*CREATE INDEX `index_adm_cine` 
ON `Cinema` (`admin`); --erreur quand j'essaie de drop l'index = ERROR 1553 (HY000): Cannot drop index 'index_adm_cine': needed in a foreign key constraint-- */

CREATE TABLE dexter
(
    id int(10) UNSIGNED NOT NULL auto_increment,
    admins int(10) UNSIGNED NOT NULL,
    Cinemas int(10) UNSIGNED NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE dexter
ADD FOREIGN KEY (admins) REFERENCES administrator(id); 

ALTER TABLE dexter
ADD FOREIGN KEY (Cinemas) REFERENCES Cinema(id); 












