-- Q1
-- a.)
SELECT employees.employeenumber, employees.firstname, employees.lastname
FROM employees, offices
WHERE employees.officecode = offices.officecode AND offices.country = 'France';

--b.)
SELECT employees.employeenumber, employees.firstname, employees.lastname
FROM employees
JOIN offices
ON offices.officecode = employees.officecode 
WHERE offices.country = 'France';

--Q2
-- a.)
SELECT amount
FROM payments
JOIN customers
ON customers.customernumber = payments.customernumber
WHERE customers.country = 'Canada'
ORDER BY payments.customernumber;


--b.)
SELECT *
FROM payments
JOIN customers
ON customers.customernumber = payments.customernumber
WHERE customers.country = 'Canada'
ORDER BY payments.customernumber;

--c.)
SELECT *
FROM payments
JOIN customers
ON customers.customernumber = payments.customernumber
WHERE customers.country = 'Canada'
ORDER BY payments.customernumber;
--Need to change date to text

--3.

SELECT customers.customernumber, customers.customername
FROM customers
JOIN payments
ON customers.customernumber = payments.customernumber
WHERE customers.country = 'USA' AND payments.amount IS NULL;

--4.
CREATE VIEW vWCustomerOrder AS
SELECT orders.ordernumber, orders.orderdate, 
       products.productname, orderdetails.quantityordered, products.buyprice
FROM orders, products, orderdetails
WHERE orders.ordernumber IS NOT NULL;

--b.)
SELECT * FROM vwCustomerOrder;

--5.
SELECT * FROM vwCustomerOrder
WHERE customernumber = 124
ORDER BY ordernumber DESC, orderdetails.orderlinenumber;

--6.
SELECT customers.customernumber, customers.customername, customers.phone, customers.creditlimit
FROM customers
JOIN orders
ON customers.customernumber = orders.customernumber
WHERE orders.ordernumber IS NOT NULL;

--7.
CREATE VIEW vwEmployeeManagers AS
SELECT *
FROM employees;

--8.
CREATE OR REPLACE VIEW vwEmployeeManager AS
SELECT *
FROM employees
WHERE reportsto IS NOT NULL;

--9. 
DROP VIEW vwCustomerOrder;
DROP VIEW vwEmployeeManager;