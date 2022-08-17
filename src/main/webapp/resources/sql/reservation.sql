CREATE TABLE reservation (
	number int,
	id varchar(50),
	code varchar(50),
	seat varchar(10),
	reservationDate datetime,
	PRIMARY KEY (number, seat),
	FOREIGN KEY (code) REFERENCES movie(code) ON DELETE CASCADE,
	FOREIGN KEY (id) REFERENCES user(id) ON DELETE CASCADE
);