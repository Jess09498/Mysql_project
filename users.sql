
CREATE DATABASE Triggers;
USE Triggers;

CREATE TABLE users (
	username VARCHAR(100),
    age INT
);
  INSERT INTO users() 
	VALUES ('Bobby', 23 ),
		('Maddie', 16);
        
SELECT *FROM users;
INSERT INTO users() 
	VALUES ('Kim', 15);
-- Error Code: 1644. Must be an adult! after running the trigger: must_be_adult


