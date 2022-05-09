Create database if not exists MovieCatalogue;
use MovieCatalogue;
create table `Genre` (
    `GenreID` int not null auto_increment,
    `GenreName` varchar(30) not null,
    primary key (`GenreID`)
);

create table if not exists `Director` (
    `DirectorID` int not null auto_increment,
    `FirstName` varchar(30) not null,
    `LastName` varchar(30) not null,
    `BirthDate` date null,
    primary key (`DirectorID`)
);
create table if not exists `Rating` (
	`RatingID` int not null auto_increment,
    `RatingName` char(5) not null,
    primary key (`RatingID`)
);
create table if not exists `Actor` (
	`ActorID` int not null auto_increment,
    `FirstName` varchar(30) not null,
    `LastName` varchar(30) not null,
    `BirthDate` date,
    primary key (`ActorID`)
);
create table if not exists `Movie` (
    `MovieID` int not null auto_increment,
    `GenreID` int not null,
    foreign key fk_MovieGenre (`GenreID`)
       references `Genre` (`GenreID`),
	`DirectorID` int not null, 
        foreign key fk_MovieDirector (`DirectorID`)
        references `Director` (`DirectorID`),
	`RatingID` int not null,
	    foreign key fk_MovieRating (`RatingID`)
        references `Rating` (`RatingID`),
	`Title` varchar(128) not null,
    `ReleaseDate` date,
    primary key (`MovieID`)
);
create table if not exists `CastMember` (
    `CastMemberID` int not null auto_increment,
	`ActorID` int not null,
        foreign key fk_CastMemberActor(`ActorID`)
        references `Actor`(`ActorID`),
	`MovieID` int not null,
        foreign key fk_CastMemberMovie(`MovieID`)
        references `Movie` (`MovieID`),
	`Role` varchar(50) not null,
    primary key (`CastMemberID`)
);
SELECT * FROM MovieCatalogue;
INSERT INTO Actor (ActorID, FirstName, LastName, BirthDate)
    VALUES (1, 'Bill', 'Murray', '1950/09/21'),
    (2, 'Dan', 'Aykroyd', '1952/07/01'),
    (3, 'John', 'Candy', '1950/10/31'),
    (4, 'Steve', 'Martin', null),
    (5, 'Sylvester', 'Stalllone', NULL);

SELECT * FROM Actor;
INSERT INTO Director(DirectorID, FirstName, LastName, BirthDate)
    VALUES (1, 'Ivan', 'Reitman', '1946/10/27'),
    (2, 'Ted', 'Kotcheff', null);
    
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




        
	
       
       
       
