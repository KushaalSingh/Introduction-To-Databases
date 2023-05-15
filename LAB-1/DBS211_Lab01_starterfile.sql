-- ----------------------------------
-- DBS211 - Lab 01
-- Name: Kushaal Singh
-- StudentID: 115320228
-- Date: 13/5/2023
-- ----------------------------------

-- Question 1
/* How many tables have been created? List the names of the created tables. */

/* 13 */


-- Question 2 
/* Click on table customers. Click on the Data tab near the top of the worksheet. How many rows arethere in the table customers? */

/* 122 */

-- Question 3
/* What SQL statement would return the same results.
   Write the statement in the .sql file and execute it.
   You will learn how to select rows and columns from a table by writing SQL select statements later inthis course. */
   
    SELECT * FROM CUSTOMERS;


-- Question 4
/* How many columns does the customers table have? List the column names. */

/* 12 Colums: 
   1.  CUSTOMERNUMBER
   2.  CUSTOMERNAME
   3.  CONTACTLASTNAME
   4.  CONTACTFIRSTNAME
   5.  PHONE
   6.  ADDRESSLINE1
   7.  ADDRESSLINE2
   8.  CITY
   9.  STATE
   10. POSTALCODE
   11. CONUNTRY
   12. SALESREPEMPLOYEENUMBER
   13. CREDITLIMIT */
   

-- Question 5
/* What is the value of each column in the first row in table customers?
   Write the column name and thecolumn data type in addition to the value. */
   
/* 1.  CUSTOMERNUMBER : NUMBER (38, 0) : 314
   2.  CUSTOMERNAME : VARCHAR2(50 BYTE) : Petit Auto
   3.  CONTACTLASTNAME : VARCHAR2(50 BYTE) : Dewey
   4.  CONTACTFIRSTNAME : VARCHAR2(50 BYTE) : Catherine 
   5.  PHONE : VARCHAR2(50 BYTE) : (02) 5554 67
   6.  ADDRESSLINE1 : VARCHAR2(50 BYTE) : Rue Joseph-Bens 532
   7.  ADDRESSLINE2 : VARCHAR2(50 BYTE) : (null)
   8.  CITY : VARCHAR2(50 BYTE) : Bruxelles
   9.  STATE : VARCHAR2(50 BYTE) : (null)
   10. POSTALCODE : VARCHAR2(15 BYTE) : B-1180
   11.  COUNTRY : VARCHAR2(50 BYTE) : Belgium
   12. SALESREPEMPLOYEENUMBER : NUMBER(38,0) : 1401
   13. CREDITLIMIT : NUMBER(10,2) : 79900 */
   

-- Question 6
/* Write the number of rows and columns for the rest of the tables in your schema. Format it somethinglike the following. */

/* [TABLE NAME]         [ROWS]          [COLUMNS]
    COUNTRIES             25                3
    CUSTOMERS             122               13
    EMPLOYEES             23                8
    LOCATIONS             23                6
    OFFICES               7                 9
    ORDERDETAILS          56                5
    ORDERS                56                7
    PAYMENTS              56                4
    PRODUCT_CATEGORIES    5                 2
    PRODUCTLINES          7                 4
    PRODUCTS              110               10
    REGIONS               4                 2
    WAREHOUSES            9                 3 */
   

-- Question 7
/* Right Click on the orderdetails table and choose tables/count rows. How many rows does the orderdetails table include? */

/* 2996 */


-- Question 8
/* Write the following SQL statement in the new tab
   desc offices 
   You can also write
   describe offices;
   What is the result of the statement execution?*/

/* Following the the result of executing "DESCRIBE OFFICES;": 
   Name         Null?    Type         
------------ -------- ------------ 
OFFICECODE   NOT NULL VARCHAR2(10) 
CITY         NOT NULL VARCHAR2(50) 
PHONE        NOT NULL VARCHAR2(50) 
ADDRESSLINE1 NOT NULL VARCHAR2(50) 
ADDRESSLINE2          VARCHAR2(50) 
STATE                 VARCHAR2(50) 
COUNTRY      NOT NULL VARCHAR2(50) 
POSTALCODE   NOT NULL VARCHAR2(15) 
TERRITORY    NOT NULL VARCHAR2(10) */


-- Question 9
/* Type the following statements in, execute them, then briefly describe what the statement is doing!
    SELECT * FROM employees;
    SELECT * FROM customer ORDER BY ContactLastName; */

/* 1. The "SELECT * FROM employees;" command displays the 'employees' table with all the values that are contained within it.
   2. The "SELECT * FROM customer ORDER BY ContactLastName;" command displays the 'customer' table by the alphabetical order 
      of the 'ContactLastName' column. */


-- Question 10
/* How many constraints does the products table have? */

/* There are 0 constraints in the following table */


-- Question 11
/* Find a way to turn on the line numbers in the gutter. */

/* Step 1: Right click on the gutter
   Step 2: click on "Toggle Line Numbers" */


-- Question 12
/* Set the font size in the worksheet editor to a size that is best for you */

/* Step 1: Click on 'Tools'
   Step 2: Click on 'Preferences
   Step 3: Go to 'Code editor'
   Step 4: Go to 'Fonts'
   Step 5: Select your desired font size */
   

