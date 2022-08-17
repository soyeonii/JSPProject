CREATE TABLE movie (
	code varchar(50),
	title varchar(50),
	director varchar(50),
	actor varchar(50),
	genre varchar(50),
	rating varchar(50),
	runningTime int,
	country varchar(50),
	releaseDate date,
	plot text,
	fileName varchar(50),
	PRIMARY KEY (code)
);