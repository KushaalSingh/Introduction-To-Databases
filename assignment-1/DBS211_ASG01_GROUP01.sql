--Q1 Solution

SELECT
  EMPLOYEENUMBER as "Employee Number",
  LASTNAME || ', ' || FIRSTNAME AS "Employee Name",
  phone as "Phone",
  extension as "Extension",
  city as "City",
  CASE WHEN reportsto IS NULL THEN 'Unknow' END AS "Manager ID",
  CASE WHEN lastname is not null then 'Unknown' END as "Manager Name"
FROM
  EMPLOYEES e
  LEFT JOIN offices o ON e.officecode = o.officecode
  WHERE reportsto  IS NULL;

--Q2 Solution

SELECT employeenumber AS "Employee Number",
            firstname || ' ' || lastname AS "Employee Name",
            phone AS "Phone",
            extension AS "Extension",
            city AS "City"
FROM
  EMPLOYEES e
  LEFT JOIN offices o ON e.officecode = o.officecode
  WHERE city in('Paris','Tokyo','NYC')
  ORDER BY city,employeenumber;
  
  --Q3 Solution
  SELECT
  e.employeenumber AS "Employee Number",
  e.lastname || ', ' || e.firstname AS "Employee Name",
  o.phone AS "Phone",
  e.extension AS "Extension",
  o.city AS "City",
  e.reportsto AS "Manager ID",
  m.firstname || ' ' || m.lastname AS "Manager Name"
FROM
  EMPLOYEES e
  LEFT JOIN offices o ON e.officecode = o.officecode
  LEFT JOIN EMPLOYEES m ON e.reportsto = m.employeenumber
WHERE
  o.city IN ('Paris', 'Tokyo', 'NYC')
ORDER BY
  o.city, e.employeenumber;
  
--Q4 Solution
SELECT
    DISTINCT e.reportsto AS "Manager ID",
    m.firstname || ' ' || m.lastname AS "Manager Name",
    o.country AS "Country",
    CASE
        WHEN m.reportsto IS NULL THEN 'Does not report to anyone'
        WHEN m.reportsto = 1002 THEN 'Reports to Diane Murphy (President)'
        ELSE 'Reports to Mary'
    END AS "Reports To"
FROM
    EMPLOYEES e
    INNER JOIN offices o ON e.officecode = o.officecode
    INNER JOIN EMPLOYEES m ON e.reportsto = m.employeenumber
WHERE
    o.officecode = 1
    AND e.reportsto IN (1056)
UNION
SELECT
    DISTINCT e.reportsto AS "Manager ID",
    m.firstname || ' ' || m.lastname AS "Manager Name",
    o.country AS "Country",
    CASE WHEN m.reportsto IS NULL THEN 'Does not report to anyone' ELSE 'Reports to Mary (VP Sales)' END AS "Reports To"
FROM
    EMPLOYEES e
    INNER JOIN offices o ON e.officecode = o.officecode
    INNER JOIN EMPLOYEES m ON e.reportsto = m.employeenumber
WHERE
    o.officecode IN (1, 4, 5, 6)
    AND e.reportsto IN (1002, 1088, 1102, 1143, 1621)
ORDER BY
    "Manager ID";

--Q5 Solution
SELECT 
    c.customernumber,
    c.CUSTOMERNAME,
    p.PRODUCTCODE,
    p.MSRP AS Old_price,
    ROUND ((MSRP-MSRP*0.1),2) AS New_price
FROM ORDERS a
INNER JOIN ORDERDETAILS b ON b.ordernumber = a.ordernumber
LEFT JOIN CUSTOMERS c ON c.customernumber =a.customernumber
LEFT JOIN PRODUCTS p ON p.PRODUCTCODE = b.PRODUCTCODE
WHERE  p.productvendor = 'Exoto Designs'  AND b.QUANTITYORDERED>55
ORDER BY c.customernumber;

--Q6
--A)
SELECT c.customernumber, c.customername
FROM customers c
JOIN (
    SELECT o1.customernumber
    FROM orders o1
    JOIN orders o2 ON o1.customernumber = o2.customernumber AND o1.orderNumber != o2.orderNumber
    GROUP BY o1.customernumber
) o ON c.customernumber = o.customernumber
ORDER BY c.customernumber;


--B)
SELECT customer.customernumber, customer.customername
FROM customers customer
LEFT JOIN orders ON customer.customernumber = orders.customernumber
WHERE customer.customernumber = 415
  AND customer.customernumber IN (
    SELECT customernumber
    FROM orders
    GROUP BY customernumber
    HAVING COUNT(*) = 1
)
ORDER BY customer.customernumber


