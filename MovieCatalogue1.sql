CREATE DATABASE IF NOT EXISTS MovieCatalogue;
USE MovieCatalogue;
CREATE TABLE `Genre` (
    `GenreID` INT NOT NULL AUTO_INCREMENT,
    `GenreName` VARCHAR(30) NOT NULL,
    PRIMARY KEY (`GenreID`)
);

CREATE TABLE IF NOT EXISTS `Director` (
    `DirectorID` INT NOT NULL AUTO_INCREMENT,
    `FirstName` VARCHAR(30) NOT NULL,
    `LastName` VARCHAR(30) NOT NULL,
    `BirthDate` DATE NULL,
    PRIMARY KEY (`DirectorID`)
);
CREATE TABLE IF NOT EXISTS `Rating` (
	`RatingID` INT NOT NULL AUTO_INCREMENT,
    `RatingName` CHAR(5) NOT NULL,
    PRIMARY KEY (`RatingID`)
);
CREATE TABLE IF NOT EXISTS `Actor` (
	`ActorID` INT NOT NULL AUTO_INCREMENT,
    `FirstName` VARCHAR(30) NOT NULL,
    `LastName` VARCHAR(30) NOT NULL,
    `BirthDate` DATE,
    PRIMARY KEY (`ActorID`)
);
CREATE TABLE IF NOT EXISTS `Movie` (
    `MovieID` INT NOT NULL AUTO_INCREMENT,
    `GenreID` INT NOT NULL,
    FOREIGN KEY fk_MovieGenre (`GenreID`)
       REFERENCES `Genre` (`GenreID`),
	`DirectorID` INT NOT NULL, 
        FOREIGN KEY fk_MovieDirector (`DirectorID`)
        REFERENCES `Director` (`DirectorID`),
	`RatingID` INT NOT NULL,
	    FOREIGN KEY fk_MovieRating (`RatingID`)
        REFERENCES `Rating` (`RatingID`),
	`Title` VARCHAR(128) NOT NULL,
    `ReleaseDate` DATE,
    PRIMARY KEY (`MovieID`)
);
CREATE TABLE IF NOT EXISTS `CastMember` (
    `CastMemberID` INT NOT NULL AUTO_INCREMENT,
	`ActorID` INT NOT NULL,
        FOREIGN KEY fk_CastMemberActor(`ActorID`)
        REFERENCES `Actor`(`ActorID`),
	`MovieID` INT NOT NULL,
        FOREIGN KEY fk_CastMemberMovie(`MovieID`)
        REFERENCES `Movie` (`MovieID`),
	`Role` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`CastMemberID`)
);
SELECT * FROM MovieCatalogue;
INSERT INTO Actor (ActorID, FirstName, LastName, BirthDate)
    VALUES (1, 'Bill', 'Murray', '1950/09/21'),
    (2, 'Dan', 'Aykroyd', '1952/07/01'),
    (3, 'John', 'Candy', '1950/10/31'),
    (4, 'Steve', 'Martin', NULL),
    (5, 'Sylvester', 'Stalllone', NULL);

SELECT * FROM Actor;
INSERT INTO Director(DirectorID, FirstName, LastName, BirthDate)
    VALUES (1, 'Ivan', 'Reitman', '1946/10/27'),
    (2, 'Ted', 'Kotcheff', NULL);
    
INSERT INTO Rating (RatingID, RatingName)
VALUES (1, 'G'),
(2, 'PG'),
(3, 'PG-13'),
(4, 'R');

INSERT INTO Genre(GenreID, GenreName)
    VALUES (1, 'Action'),
(2, 'Comedy'),
(3, 'Drama'),
(4, 'Horror');


INSERT INTO Movie (MovieID, GenreID, DirectorID, RatingID, Title, ReleaseDate)
VALUES (1, 1, 2, 4, 'Rambo: First Blood', '1982/10/22'),
(2, 2, 1, 4, 'Planes, Trains & Automobiles', '1987/11/25'),
(3, 2, 1, 2, 'Ghostbusters', NULL),
(4, 2, 2, 2, 'The Great Outdoors', '1988/6/17');

INSERT INTO CastMember (CastMemberID, ActorID, MovieID, Role)
    VALUE  (1, 5, 1, 'John Rambo'),
    (2, 4, 2, 'Neil Page'),
    (3, 3, 2, 'Del Griffith'),
    (4, 1, 3, 'Dr. Peter venkman'),
    (5, 2, 3, 'Dr. Raymond Stanz'),
    (6, 2, 4, 'Roman Craig'),
    (7, 3, 4, 'Chet Ripley');
SELECT * FROM CastMember;

UPDATE Movie SET
    Title = 'Goust Busters (1984)',
    ReleaseDate = '1984/06/08'
WHERE MovieID = 3;

UPDATE Genre SET
    GenreName = 'Action/Adventure'
WHERE GenreID = 1;

SELECT * FROM Genre;

SELECT Title FROM Movie WHERE MovieID = 3;    

UPDATE Movie SET
    Title = 'Ghostbusters (1984)'
WHERE MovieID = 3;

DELETE FROM CastMember
WHERE MovieID = 1;

DELETE FROM Movie
    WHERE MovieID = 1;
    
ALTER TABLE Actor ADD DateOfDeath date NULL;

UPDATE Actor SET
    DateOfDeath = '1994/03/04'
WHERE ActorID = 3;

SELECT * FROM Actor;

INSERT INTO Director(DirectorID, FirstName, LastName, BirthDate)
    VALUES (3, 'Orson', 'Welles', '1998/10/27');
    
SELECT * FROM Director;



        
	
       
       
       
