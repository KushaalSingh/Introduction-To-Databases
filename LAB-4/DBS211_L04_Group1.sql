-- Question 1
/* Create a new empty table employee2 the same as table employees.  Use a single statement to create the table and insert the data at the same time. */

CREATE TABLE employee2 (
    EMPLOYEENUMBER NUMBER(38,0),
    LASTNAME VARCHAR2(50 BYTE),
    FIRSTNAME VARCHAR2(50 BYTE),
    EXTENSION VARCHAR2(10 BYTE),
    EMAIL VARCHAR2(100 BYTE),
    OFFICECODE VARCHAR2(10 BYTE),
    REPORTSTO NUMBER(38,0),
    JOBTITLE VARCHAR2(50 BYTE)
);

INSERT INTO 
employee2 (
    EMPLOYEENUMBER,
    LASTNAME,
    FIRSTNAME,
    EXTENSION,
    EMAIL,
    OFFICECODE,
    REPORTSTO,
    JOBTITLE
)
SELECT
    EMPLOYEENUMBER,
    LASTNAME,
    FIRSTNAME,
    EXTENSION,
    EMAIL,
    OFFICECODE,
    REPORTSTO,
    JOBTITLE
FROM
employees;


-- Question 2
/* Modify table employee2 and add a new column username to this table. The value of this column is not required and does not have to be unique. */

ALTER TABLE employee2
ADD username VARCHAR(50);


-- Question 3
/* Delete all the data in the employee2 table */

DELETE FROM
employee2;


-- Question 4
/* Re-insert all data from the employees table into your new table employee2 using a single statement. */

ROLLBACK;


-- Question 5
/* Create a statement that will insert yourself as an employee into employee2.
        a.	Use a unique employee number of your choice.
        b.	Use your school email address.
        c.	Your extension is ‘x2222’.
        d.	Your job title will be “Cashier”.
        e.	Office code will be 4.
        f.	You will report to employee 1088.
        g.	You do not have any username. */

INSERT INTO employee2 (
    EMPLOYEENUMBER,
    LASTNAME,
    FIRSTNAME,
    EXTENSION,
    EMAIL,
    OFFICECODE,
    REPORTSTO,
    JOBTITLE
)
VALUES 
('1919', 'Singh', 'Kushaal', 'x2222', 'kna28@myseneca.ca', '4', '1088', 'Cashier');


-- Question 6
/* Create a query that displays your, and only your, employee data. */

SELECT * FROM
employee2
WHERE
extension = 'x2222';

-- Question 7
/* Create a statement to update your job title to “Head Cashier”. */

UPDATE
employee2
SET
jobtitle = 'Head Cashier'
WHERE
extension = 'x2222';

-- Question 8
/* Create a statement to insert another fictional employee into employee2.
   This employee will be a “Cashier” and will report to you. Make up fake data for the other fields.
   The fake employee does not have any username. */

INSERT INTO employee2 (
    EMPLOYEENUMBER,
    LASTNAME,
    FIRSTNAME,
    EXTENSION,
    EMAIL,
    OFFICECODE,
    REPORTSTO,
    JOBTITLE
)
VALUES 
('2003', 'Rana', 'Manju', 'x1970', 'abc@randomemail.com', '1', '1919', 'Cashier');


-- Question 9
/* Create a statement to delete yourself from employee2.  Did it work?  If not, why? */

-- It worked!!
DELETE FROM
employee2
WHERE
EXTENSION = 'x2222';

-- Question 10
/* Create a statement to delete the fake employee from employee2 and then rerun the statement to delete yourself. Did it work? Explain why? */

DELETE FROM
employee2
WHERE
extension = 'x1970'; -- To delete the fake employee


-- Question 11
/* Create a single statement that will insert both yourself and the fake employee at the same time. This time you and the fake employee will report to 1088. */

INSERT INTO employee2 (
    EMPLOYEENUMBER,
    LASTNAME,
    FIRSTNAME,
    EXTENSION,
    EMAIL,
    OFFICECODE,
    REPORTSTO,
    JOBTITLE
)
VALUES
('1919', 'Singh', 'Kushaal', 'x2222', 'kna28@myseneca.ca', '4', '1088', 'Head Cashier'),
('2003', 'Rana', 'Manju', 'x1970', 'abc@randomemail.com', '1', '1088', 'Cashier');


-- Question 12
/* Create a single statement to delete both yourself and the fake employee from employee2. */

DELETE FROM
employee2
WHERE
reportsto = 1088;


-- Question 13
/* In table employee2, generate the email address for column username for each student by concatenating the first character of employee’s first name and the employee’s last name.
   For instance, the username of employee Peter Stone will be pstone. NOTE: the username is in all lower case letters. */

UPDATE
employees2
SET
username = LOWER(SUBSTR(firstname, 1, 2) || lastname);

-- Question 14
/* In table employee2, remove all employees with office code 4. */

DELETE FROM
employee2
WHERE
officecode = 4;


-- Question 15
/* Drop table employee2 */

DROP TABLE
employees2;