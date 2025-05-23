-- Create a database called MOVIES to store movies shown in multiple theaters.
CREATE DATABASE MOVIES;
USE MOVIES;

-- Table: Movies
-- - movie_id: integer, primary key
-- - movie_title: varchar(255), not null
-- - movie_rating: varchar(255), optional
CREATE TABLE Movies (
   movie_id INTEGER PRIMARY KEY,
   movie_title VARCHAR(255) NOT NULL,
   movie_rating VARCHAR(255)
) ENGINE=INNODB;

-- Table: Theaters
-- - theater_id: integer, primary key
-- - theater_name: varchar(255), not null
-- - theater_movie_id integer, foreign key to Movies(Code)
CREATE TABLE Theaters (
   theater_id INTEGER PRIMARY KEY,
   theater_name VARCHAR(255) NOT NULL,
   theater_movie_id INTEGER,
   FOREIGN KEY (theater_movie_id) REFERENCES Movies(movie_id)
) ENGINE=INNODB;


-- Insert movies.
INSERT INTO Movies (movie_id, movie_title, movie_rating) 
	VALUES (1, 'Citizen Kane', 'PG');
INSERT INTO Movies (movie_id, movie_title, movie_rating) 
	VALUES (2, 'Singin'' in the Rain', 'G');
INSERT INTO Movies (movie_id, movie_title, movie_rating) 
	VALUES (3, 'The Wizard of Oz', 'G');
INSERT INTO Movies (movie_id, movie_title, movie_rating) 
	VALUES (4, 'The Quiet Man', NULL);
INSERT INTO Movies (movie_id, movie_title, movie_rating) 
	VALUES (5, 'North by Northwest', NULL);
INSERT INTO Movies (movie_id, movie_title, movie_rating) 
	VALUES (6, 'The Last Tango in Paris', 'NC-17');
INSERT INTO Movies (movie_id, movie_title, movie_rating) 
	VALUES (7, 'Some Like it Hot', 'PG-13');
INSERT INTO Movies (movie_id, movie_title, movie_rating) 
	VALUES (8, 'A Night at the Opera', NULL);
INSERT INTO Movies (movie_id, movie_title, movie_rating) 
	VALUES (9, 'Citizen King', 'G');

-- Insert movie Theaters.
INSERT INTO Theaters (theater_id, theater_name, theater_movie_id) 
	VALUES (1, 'Odeon', 5);
INSERT INTO Theaters (theater_id, theater_name, theater_movie_id) 
	VALUES (2, 'Imperial', 1);
INSERT INTO Theaters (theater_id, theater_name, theater_movie_id) 
	VALUES (3, 'Majestic', NULL);
INSERT INTO Theaters (theater_id, theater_name, theater_movie_id) 
	VALUES (4, 'Royale', 6);
INSERT INTO Theaters (theater_id, theater_name, theater_movie_id) 
	VALUES (5, 'Paraiso', 3);
INSERT INTO Theaters (theater_id, theater_name, theater_movie_id) 
	VALUES (6, 'Nickelodeon', NULL);


-- 1. Add the movie "One, Two, Three" without a rating.
INSERT INTO Movies (movie_id, movie_title, movie_rating) 
	VALUES (10, 'One, Two, Three', NULL);

-- 2. Set the rating "G" for all movies without a rating.
UPDATE Movies 
SET movie_rating = 'G' 
WHERE movie_rating IS NULL;

-- 3. Delete movie theaters that are showing a movie rated "NC-17".
DELETE FROM Theaters
WHERE theater_movie_id IN (
    SELECT movie_id 
    FROM Movies 
    WHERE movie_rating = 'NC-17'
);
