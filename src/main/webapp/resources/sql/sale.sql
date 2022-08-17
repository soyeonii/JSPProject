CREATE TABLE sale (
	number int,
	id varchar(50),
	code varchar(50),
	quantity int,
	saleDate datetime,
	PRIMARY KEY (number, code),
	FOREIGN KEY (code) REFERENCES product(code) ON DELETE CASCADE,
	FOREIGN KEY (id) REFERENCES user(id) ON DELETE CASCADE
);