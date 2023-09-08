-- Question 1
/* 1. Display the data for all offices. Display office code, city, state, country, and phone for all offices. */

SELECT 
officecode, city, state, country, phone
FROM 
offices;


-- Quesetion 2
/* 2. Display employee number, first name, last name, and extension for all employees whose office code is 1.
      Sort the result based on the employee number. */
      
SELECT
employeenumber, firstname, lastname, extension
FROM
employees
WHERE
officecode = 1;


-- Question 3
/* 3. Display customer number, customer name, contact first name and contact last name, and phone for all customers in Paris.
      (hint: be wary of case sensitivity) Sort the result based on the customer number. */
        
SELECT
customernumber, customername, contactfirstname, contactlastname, phone
FROM
customers
WHERE
city = 'Paris'
ORDER BY
customernumber;


-- Question 4
/* 4. Repeat the previous Query with a couple small changes:
        a.	The contact’s first and last name should be in a single column in the format “lastname, firstname”.
        b.	Show customers who are in Canada
        c.	Sort the result based on the customer name. */

-- (a):       
SELECT
customernumber, customername, contactlastname || ', ' || contactfirstname AS "Contact Name", phone
FROM
customers
WHERE
city = 'Paris'
ORDER BY
customernumber;

-- (b):
SELECT
customernumber, customername, contactlastname || ', ' || contactfirstname AS "Contact Name", phone
FROM
customers
WHERE
country = 'Canada'
ORDER BY
customernumber;

-- (c):
SELECT
customernumber, customername, contactfirstname || ', ' || contactlastname AS "Contact Name", phone
FROM
customers
WHERE
country = 'Canada'
ORDER BY
customername;


-- Question 5
/* 5.	Display customer number for customers who have payments. Do not included any repeated 
      values. Sort the result based on the customer number.
      (Hints: How do you know a customer has made a payment? You will need to access only one table for this query)
      The first 10 rows of the output result. The query returns 98 rows. */

SELECT
customernumber
FROM
customers
WHERE
creditlimit > 0
ORDER BY
customernumber;


-- Question 6
/* 6.	List customer numbers, check number, and amount for customers whose payment amount is not in the range of $1,500 to $120,000.
      Sort the output by top payments amount first. */

SELECT
customernumber, checknumber, amount
FROM
payments
WHERE
amount < 1500 OR amount > 120000
ORDER BY
amount DESC;



-- Question 7
/* 7.	Display order number, order date, status, and customer number for all orders that are cancelled.
      Sort the result according to order date. */

SELECT 
ordernumber, orderdate, status, customernumber
FROM
orders
WHERE
status = 'Cancelled'
ORDER BY
orderdate;


-- Question 8
/* 8.	The company needs to know the percentage markup for each product sold. Produce a query that outputs the ProductCode, 
      ProductName, BuyPrice, MSRP in addition to
        a. The difference between MSRP and BuyPrice (i.e. MSRP-BuyPrice) called markup
        b. The percentage markup (100 * calculated by difference / BuyPrice) called percmarkup
           rounded to 1 decimal place.
        c. Sort the result according to percmarkup.
        d. Show products with percmarkup greater than 140. */

-- (a):
SELECT
productcode, productname, buyprice, msrp, (msrp - buyprice) AS "MARKUP"
FROM
products;

-- (b):
SELECT
productcode, productname, buyprice, msrp, (msrp - buyprice) AS "MARKUP", ROUND((100 * (msrp - buyprice) / buyprice), 1) AS "PERCMARKUP"
FROM
products;

-- (c):
SELECT
productcode, productname, buyprice, msrp, (msrp - buyprice) AS "MARKUP", ROUND((100 * (msrp - buyprice) / buyprice), 1) AS "PERCMARKUP"
FROM
products
ORDER BY
percmarkup;

-- (d):
SELECT
productcode, productname, buyprice, msrp, (msrp - buyprice) AS "MARKUP", ROUND((100 * (msrp - buyprice) / buyprice), 1) AS "PERCMARKUP"
FROM
products
WHERE
(100 * (msrp - buyprice) / buyprice) > 140
ORDER BY
percmarkup;


-- Question 9
 /* 9. Display product code, product name, and quantity in stock the information of all products with string ‘co’ in their product name.
       (c and o can be lower or upper case). Sort the result according to quantity in stock. */

SELECT
productcode, productname, quantityinstock
FROM
products
WHERE
lower(productname) LIKE '%co%'
ORDER BY
quantityinstock;


-- Question 10
/* 10. Display customer number, contact first name, contact last name for all customers whose contact first name starts with letter s
       (both lowercase and uppercase) and includes letter e (both lowercase and uppercase). Sort the result according to customer number. */

SELECT
customernumber, contactfirstname, contactlastname
FROM
customers
WHERE
(contactfirstname LIKE 'S%' OR contactfirstname LIKE 's%') AND (contactfirstname LIKE '%E%' OR contactfirstname LIKE '%e%')
ORDER BY
customernumber;