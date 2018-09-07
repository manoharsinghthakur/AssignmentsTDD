
-- 1  Count the number of Non NULL rating fields in the Customers table (including repeats)

SELECT COUNT(*) FROM CUSTOMER WHERE RATING IS NOT NULL;

-- 2 Write a query that gives the names of both the salesperson and the customer for each order after the order number

SELECT ONUM,SNAME,CNAME FROM ORDERS o,CUSTOMER c, SALES_PEOPLE s WHERE o.SNUM=c.SNUM AND o.snum=s.SNUM;

-- 3 Count the number of Salespeople registering orders for each day. (If a salespersons has more than one order on given day, he or she should be counted only once).

SELECT o.odate, COUNT(DISTINCT o.snum) FROM orders o GROUP BY o.odate;

-- 4  Find all orders attributed to salespeople in London.

SELECT * FROM orders o INNER JOIN sales_people s ON s.snum=o.snum WHERE s.city='london'; 

-- 5 Find all salespeople who have customers with more than one current order

SELECT s.sname,COUNT(o.cnum) AS current_orders FROM sales_people s INNER JOIN orders o ON s.snum=o.snum  GROUP BY o.cnum HAVING current_orders > 1; 

-- 6 Write a query that selects all customers whose names begins with ‘C’.
SELECT * FROM customer WHERE cname LIKE "C%";
 
-- 7   Write a query on the Customers table that will find the highest rating in each city. Put the output in this form: for the City (city) the highest rating is: (rating)

SELECT city AS 'for the city', MAX(rating) AS 'highest rating is' FROM customer GROUP BY city;  

-- 8   Write a query that selects each customer’s smallest order.
SELECT c.cname,MIN(o.amt) FROM customer c INNER JOIN orders o ON c.cnum=o.cnum GROUP BY c.cname; 
 
-- 9  Write a query that selects the first customer in alphabetical order whose name begins with G
SELECT cname FROM customer WHERE cname LIKE "G%" ORDER BY cname LIMIT 1;

-- 10 Write a query that counts the number of different non NULL city values in the Customers table
 SELECT COUNT(DISTINCT city) FROM customer WHERE city IS NOT NULL;

-- 11  Find the average amount from the Orders table.
SELECT AVG(amt) FROM orders;

-- 12  Find all customers who are not located in Sanjose and whose rating is above 200.
SELECT * FROM customer WHERE city!='SANJOSE' AND rating>200;

-- 13  Does the customer who has placed the maximum number of orders have the maximum rating?
SELECT c.cname,c.rating, COUNT(o.cnum) FROM customer c INNER JOIN orders o ON o.cnum=c.cnum 
WHERE c.rating=(SELECT MAX(c.rating) FROM customer c) GROUP BY c.cname LIMIT 1; 
 
 OR
 
SELECT CASE WHEN EE = dd THEN 'Y' ELSE 'N' END AS Result 
FROM (
SELECT  A.CNAME, A.RATING, COUNT(o.onum)  AS dd,
(SELECT MAX(dd) FROM (
SELECT COUNT(ONUM) AS dd, CNUM  FROM Orders
GROUP BY CNUM) a) AS EE
FROM Customer A
INNER JOIN Orders o
ON A.Cnum = O.Cnum
WHERE Rating = (SELECT MAX(rating) FROM Customer)
GROUP BY A.CNAME, A.RATING
ORDER BY dd DESC LIMIT 1) B

 
-- 14  Find all records in the Customer table with NULL values in the city column
SELECT * FROM customer WHERE city IS NULL;


-- 15  Arrange the Orders table by descending customer number.
SELECT * FROM orders ORDER BY cnum DESC;
customerfrom sales_people s INNER JOIN orders o ON s.snum=o.snum;

-- 17  Find the names and numbers of all salespeople who had more the one customer.
SELECT snum, sname FROM sales_people WHERE snum IN (SELECT snum FROM customer GROUP BY snum HAVING COUNT(*) > 1)

-- 18  Count the orders of each of the salespeople and output the results in descending order.

SELECT s.sname, COUNT(o.onum) AS no_of_orders FROM sales_people s INNER JOIN orders o ON s.snum=o.snum GROUP BY s.sname ORDER BY no_of_orders DESC;

--  19  List the Customer table if and only if one or more of the Customers in the Customer table are located in SanJose.
SELECT * FROM customer WHERE city = 'SANJOSE';

--  20  Find the largest order taken by each salesperson.
SELECT s.sname, MAX(o.amt) FROM sales_people s INNER JOIN orders o ON s.snum=o.snum GROUP BY s.sname;

--  21  Find customers in SanJose who have a rating above 200.
SELECT cname FROM customer WHERE city='SANJOSE' AND rating > 200;

--  22  List all the orders of salesperson Motika from the Orders table.
SELECT s.sname, COUNT(o.snum) FROM sales_people s INNER JOIN orders o ON s.snum=o.snum WHERE sname='MOTIKA' GROUP BY s.sname;

--  23  Find salespeople who have multiple customers.
SELECT sname FROM sales_people WHERE snum IN (SELECT snum FROM customer GROUP BY snum HAVING COUNT(*) > 1)

--  24  Find salespeople with customers located in their city.
SELECT s.sname,c.cname,s.city,c.city FROM sales_people s INNER JOIN customer c ON c.city=s.city;

--  25  Find the largest orders for serres and Rifkin.
SELECT s.sname, MAX(o.amt) FROM sales_people s INNER JOIN orders o ON s.snum=o.snum WHERE sname IN ('SERRES','RIKKLIN') GROUP BY s.sname;

-- 26 Find all salespeople that are located in either Barcelona or London.
SELECT s.sname, s.city FROM sales_people s  WHERE s.city IN ('Barcelona','London');

-- 27 Find all salespeople with only one customer.
SELECT sname FROM sales_people WHERE snum IN (SELECT snum FROM customer GROUP BY snum HAVING COUNT(*)=1);

-- 28 Find salespeople whose sales is greater the avg sales
SELECT * FROM sales_people WHERE 
