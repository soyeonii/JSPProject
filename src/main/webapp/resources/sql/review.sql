CREATE TABLE review (
	code varchar(50),
	id varchar(50),
	star int,
	content text,
	createDate datetime,
	PRIMARY KEY (code, id),
	FOREIGN KEY (code) REFERENCES movie(code) ON DELETE CASCADE,
	FOREIGN KEY (id) REFERENCES user(id) ON DELETE CASCADE
);