/*users*/
INSERT INTO users (username, password) VALUES ('andre','$2a$10$TrYQ7vCwU7/c6zrcSz0CHu7Wv75VImPfieYy2zaibWMBnrHx3mioW');
INSERT INTO users (username, password) VALUES ('david','$2a$10$TrYQ7vCwU7/c6zrcSz0CHu7Wv75VImPfieYy2zaibWMBnrHx3mioW');

/*roles*/
INSERT INTO authorities (username, authority) VALUES ('andre','USER');
INSERT INTO authorities (username, authority) VALUES ('andre','HR');
INSERT INTO authorities (username, authority) VALUES ('david','USER');
INSERT INTO authorities (username, authority) VALUES ('david','ADMIN');