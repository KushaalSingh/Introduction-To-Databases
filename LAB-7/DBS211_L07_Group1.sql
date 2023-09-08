--1. Transactions can be started by using the SET TRANSACTION command, BEGIN command, or implicity through DML COMMANDS and DDL commands

--2.

CREATE TABLE newEmployees (
    employeenumber NUMBER(38),
    lastname VARCHAR2(50),
    firstname VARCHAR2(50),
    extension VARCHAR2(10),
    email VARCHAR2(100),
    officecode VARCHAR(10),
    reportsto NUMBER(38) NULL, 
    jobtitle VARCHAR2(50)
);

--3.

SET AUTOCOMMIT OFF;
SET TRANSACTION READ WRITE;

--4.

INSERT INTO newEmployees (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle)
SELECT employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle FROM employees;

--5. 

SELECT * FROM  newEmployees;
--There are 23 rows in this table.

--6. 

ROLLBACK;
SELECT * FROM  newEmployees;
--There are not any rows for this table.

--7. 

INSERT INTO newEmployees (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle)
SELECT employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle FROM employees;
COMMIT;
SELECT * FROM newEmployees;
-- There are 23 rows in this table.

--8. 

UPDATE newEmployees SET jobTitle = 'unknown';
-- After running this query, 23 rows were updated.

--9.

COMMIT;
SELECT * FROM  newEmployees;

--10. 

ROLLBACK;
SELECT * FROM  newEmployees;

--10.a
SELECT firstname || ' ' || lastname FROM newEmployees
WHERE jobTitle = 'unknown';
-- The 23 rows that were updated in question 8 are still there in the table.

--10.b
-- The rollback command was not effective. I was able to sucessfully retrieve 23 employees where their job title is unknown.

--10.c
-- The difference between the result of the rollback execution from Task 6 and the execution of this task is that I was not able
-- to retrieve any information after using the rollback command. Whereas in task 10, I was able to retrieve information,

--11. 

--Truncating the table to be able to use the order by command for task 12

BEGIN;
TRUNCATE TABLE newEmployees;
SELECT * FROM  newEmployees; 

--12. Make view that queries all records in newemployees table by last name and first name

CREATE VIEW vwNewEmps AS
SELECT * FROM newEmployees
ORDER BY firstname, lastname;

--13. 

ROLLBACK;
SELECT * FROM  newEmployees; -- Rollback is not effective

--13. A

--There are no employees in the newEmployees table.

--13.B

-- The rollback was not effective because it could not retrieve the values that the table had previously.

--14.

BEGIN;
INSERT INTO newEmployees (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle)
SELECT employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle FROM employees;

--15. 

SAVEPOINT insertion;

--16.

UPDATE newEmployees SET jobTitle = 'unknown';
SELECT * FROM  newEmployees; -- Jobtitle is set to null.

--17.

ROLLBACK to insertion;
SELECT * FROM newEmployees; -- The data came back and the job title is how it was original (does not have unknown).

--18.

ROLLBACK;
SELECT * FROM  newEmployees; -- The tuples are all gone now. The only thing is left are the attributes.

--PART B

--19. 

REVOKE all privileges ON newEmployees FROM PUBLIC;

--20. 

GRANT select ON newEmployees TO dbs211_232nbb36;

--21. 

GRANT INSERT, UPDATE, DELETE ON newEmployees to dbs211_232nbb36;

--22. WRITE STATEMENT THAT DENIES ALL ACCESS TO NEW EMPLOYEES TABLE

REVOKE all privileges ON newEmployes FROM dbs211_232nbb36;

-- PART C

--23. 

DROP TABLE newEmployees;
DROP view vwNewEmps;
