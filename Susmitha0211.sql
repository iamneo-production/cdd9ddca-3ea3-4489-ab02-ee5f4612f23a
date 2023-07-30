-- BELOW QUERIES ARE GIVEN AS TASKS TO DO IN WORKSPACE.

-- 1.Write a SQL Query to How many products were sold in February 2019?

select count(*) as products_sold from ECOMMERCE where PURCHASE_DATE > '2019-01-31' AND PURCHASE_DATE < '2019-03-01' ;

-- 2.Write a SQL Query to Total sale amount in each year?

select substr(purchase_date,1,4) as year,sum(PRICE*QUANTITY) as total_sales_amount  from ECOMMERCE group by substr(purchase_date,1,4);

-- 3.Write a SQL Query to What was the total sales amount of each product on a month-wise basis in the year 2019?

select substr(purchase_date,6,2) as months, PRODUCTNAME ,sum(PRICE*QUANTITY) as total_sales_amount  from ECOMMERCE where substr(purchase_date,1,4)='2019' group by substr(purchase_date,6,2),PRODUCTNAME;

-- 4.Write a SQL Query to Count the Customers from each country?

select country,count(CUSTOMERNO) as total_count from ECOMMERCE group by COUNTRY;

-- 5. Write a SQL Query to List all the unique product names sold from each year?

select substr(purchase_date,1,4) as year, PRODUCTNAME  from ECOMMERCE  group by substr(purchase_date,1,4),PRODUCTNAME;


--I HAVE TRIED BELOW QUERIES WHICH ARE NOT MENTIONED IN WORKSPACE 


-- 6. Get the earliest transaction date in the table.

SELECT MIN(PURCHASE_DATE) AS EARLIEST_DATE FROM ECOMMERCE;

-- 7.Retrieve count of transactions where the quantity is less than 10.

SELECT count(*) FROM ECOMMERCE WHERE QUANTITY < 10;

-- 8.Get the most expensive product sold.

SELECT DISTINCT(PRODUCTNAME) FROM ECOMMERCE WHERE PRICE = (SELECT MAX(PRICE) FROM ECOMMERCE);

-- 9.Get the  products with the sales revenue IN DECREASING order.

SELECT PRODUCTNO, SUM(PRICE * QUANTITY) AS TOTAL_REVENUE FROM ECOMMERCE GROUP BY PRODUCTNO ORDER BY TOTAL_REVENUE ;

-- 10.Get the average price of products sold.

SELECT AVG(PRICE) AS AVERAGE_PRICE FROM ECOMMERCE;

-- 11.Get the maximum quantity sold in a single transaction.

SELECT MAX(QUANTITY) AS MAX_QUANTITY_SOLD FROM ECOMMERCE;

-- 12.Get the total number of transactions.

SELECT COUNT(*) AS TOTAL_TRANSACTIONS FROM ECOMMERCE;

-- 13.Get the Latest transaction date in the table.

SELECT MAX(PURCHASE_DATE) AS LATEST_DATE FROM ECOMMERCE;

-- 14.Get the total quantity sold for each product.

SELECT PRODUCTNO, SUM(QUANTITY) AS TOTAL_QUANTITY FROM ECOMMERCE GROUP BY PRODUCTNO;

-- 15.Get the total sales revenue for transactions in a specific country.

SELECT SUM(PRICE * QUANTITY) AS TOTAL_REVENUE FROM ECOMMERCE WHERE COUNTRY = '"United Kingdom"';
