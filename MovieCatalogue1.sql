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
    


        
	
       
       
       
