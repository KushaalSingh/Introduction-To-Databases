-- ----------------------------------
-- DBS211 - Lab 03
-- Name: Kushaal Singh
-- StudentID: 115320228
-- Date: 13/5/2023
-- ----------------------------------

-- Question 1
/* 1. Display the data for all offices. Display office code, city, state, country, and phone for all offices. */

SELECT officecode, city, state, country, phone
FROM offices;


-- Quesetion 2
/* 2. Display employee number, first name, last name, and extension for all employees whose office code is 1.
      Sort the result based on the employee number. */
      
SELECT employeenumber, firstname, lastname, extension
FROM employees
WHERE officecode = 1;


-- Question 3
/* 3. Display customer number, customer name, contact first name and contact last name, and phone for all customers in Paris.
      (hint: be wary of case sensitivity) Sort the result based on the customer number. */
        
SELECT customernumber, customername, contactfirstname, contactlastname, phone
FROM customers
WHERE city='Paris'
ORDER BY customernumber;


-- Question 4
/* 4. Repeat the previous Query with a couple small changes:
        a.	The contact’s first and last name should be in a single column in the format “lastname, firstname”.
        b.	Show customers who are in Canada
        c.	Sort the result based on the customer name. */
        
SELECT customernumber, CONCAT(contactlastname, ',', contactfirstname) AS contactfullname, phone
FROM customers
WHERE city='Paris'
ORDER BY customernumber;