use springlab;

DROP TABLE IF EXISTS `authorities`;
DROP TABLE IF EXISTS `users`;

CREATE TABLE users(
	username VARCHAR(50) NOT NULL PRIMARY KEY,
	password VARCHAR(250) NOT NULL
);

CREATE TABLE authorities (
	username VARCHAR(50) NOT NULL,
	authority VARCHAR(50) NOT NULL,
	CONSTRAINT fk_authorities_users FOREIGN KEY(username) REFERENCES users(username)
);
CREATE UNIQUE INDEX ix_auth_username ON authorities (username,authority);