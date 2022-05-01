Create database if not exists MovieCatalogue ;
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

