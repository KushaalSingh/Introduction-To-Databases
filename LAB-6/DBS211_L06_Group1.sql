SET AUTOCOMMIT ON;
--PART A
--1
CREATE TABLE L6_MOVIES (
    mid INT PRIMARY KEY,
    title VARCHAR(35) NOT NULL,
    releaseYear INT NOT NULL,
    director INT NOT NULL,
    score DECIMAL(3,2) CHECK (score > 0 AND score <= 5)
);
CREATE TABLE L6_ACTORS (
    aid INT PRIMARY KEY,
    firstName INT NOT NULL,
    lastName INT NOT NULL
);
CREATE TABLE L6_CASTINGS (
    movieid INT,
    actorid INT,
    PRIMARY KEY (movieid, actorid),
    FOREIGN KEY (movieid) REFERENCES L6_MOVIES (mid),
    FOREIGN KEY (actorid) REFERENCES L6_ACTORS (aid)
);
CREATE TABLE L6_DIRECTORS (
    directorid NUMBER,
    firstname VARCHAR(20) NOT NULL,
    lastname VARCHAR(30) NOT NULL
);
--Q2 Solution// add primary key for directors tablethen add the fk 
--ADD PRIMARY KEY--
ALTER TABLE L6_DIRECTORS
ADD CONSTRAINT  PK_director PRIMARY KEY (directorid)
--ADD FOREIGN KEY FOR MOVIES
ALTER TABLE L6_MOVIES
ADD CONSTRAINT FK_movie_director
FOREIGN KEY (director)
REFERENCES L6_DIRECTORS (directorid);

--q3
ALTER TABLE  L6_MOVIES
ADD CONSTRAINT UQ_title UNIQUE (title);

--Q4
INSERT INTO L6_DIRECTORS (directorid, firstname, lastname)
VALUES
  (1010, 'Rob', 'Minkoff');

INSERT INTO L6_DIRECTORS (directorid, firstname, lastname)
VALUES
  (1020, 'Bill', 'Condon');

INSERT INTO L6_DIRECTORS (directorid, firstname, lastname)
VALUES
  (1050, 'Josh', 'Cooley');

INSERT INTO L6_DIRECTORS (directorid, firstname, lastname)
VALUES
  (2010, 'Brad', 'Bird');

INSERT INTO L6_DIRECTORS (directorid, firstname, lastname)
VALUES
  (3020, 'Lake', 'Bell');

INSERT INTO L6_MOVIES (mid, title, releaseYear, director, score)
VALUES
  (100, 'The Lion King', 2019, 3020, 3.50);

INSERT INTO L6_MOVIES (mid, title, releaseYear, director, score)
VALUES
  (200, 'Beauty and the Beast', 2017, 1050, 4.20);

INSERT INTO L6_MOVIES (mid, title, releaseYear, director, score)
VALUES
  (300, 'Toy Story 4', 2019, 1020, 4.50);

INSERT INTO L6_MOVIES (mid, title, releaseYear, director, score)
VALUES
  (400, 'Mission Impossible', 2018, 2010, 5.00);

INSERT INTO L6_MOVIES (mid, title, releaseYear, director, score)
VALUES
  (500, 'The Secret Life of Pets', 2016, 1010, 3.90);
  
  --Q5
-- Drop all tables// The order of tables when removing them is important if there are 
--foreign key constraints between the tables. If a table has a foreign key constraint 
--referencing another table, you need to drop the dependent table first before dropping the referenced table.
DROP TABLE L6_CASTINGS;
DROP TABLE L6_ACTORS;
DROP TABLE L6_MOVIES;
DROP TABLE L6_DIRECTORS;

--Q6 Solution
CREATE TABLE employee2 AS
SELECT *
FROM employees;

--Q7 Solution
ALTER TABLE employee2
ADD username VARCHAR(50);

--Q8
DELETE FROM employee2;

--Q9
INSERT INTO employee2
SELECT * FROM employees;

--Q10
UPDATE employee2
SET firstname = 'Chris', lastname = 'Santos'
WHERE employeenumber = 1002;


--Q11
UPDATE employee2
SET username = LOWER(SUBSTR(firstname, 1, 1) || lastname);
SELECT*FROM employee2
SELECT * FROM EMPLOYEE2

--Q12
DELETE FROM employee2
WHERE office_code = 4;

--Q13
DROP TABLE employee2
