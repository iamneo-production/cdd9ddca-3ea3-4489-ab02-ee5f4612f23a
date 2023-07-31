
SET TIMING ON ;

/* 1.Write a SQL Query 
to How many products were sold in February 2019? */
SELECT COUNT(*) FROM ECOMMERCE WHERE substr(purchase_date,6,2) =02 AND substr(purchase_date,1,4) =2019;

/* 2.Write a SQL Query 
to Total sale amount in each year? */
SELECT substr(purchase_date,1,4),SUM(PRICE * QUANTITY) FROM ECOMMERCE GROUP BY substr(purchase_date,1,4);

/* 3.Write a SQL Query
 to What was the total sales amount of each product on a month-wise basis in the year 2019?*/
SELECT substr(purchase_date,6,2),SUM(PRICE * QUANTITY) FROM ECOMMERCE  WHERE substr(purchase_date,1,4)=2019
GROUP BY substr(purchase_date,6,2),PRODUCTNAME;

/*4.Write a SQL Query
 to Count the Customers from each country? */
SELECT COUNTRY,COUNT(*) FROM ECOMMERCE GROUP BY COUNTRY;

/*  5.Write a SQL Query 
to List all the unique product names sold from each year?*/
SELECT DISTINCT PRODUCTNAME,substr(purchase_date,1,4) AS YEAR FROM ECOMMERCE 
GROUP BY PRODUCTNAME,substr(purchase_date,1,4),PRODUCTNAME;

-- OPTIONAL QUERIES --

/* write a SQL Query
 to find  maximum quantity sold in a single transaction */

SELECT MAX(QUANTITY) AS MAX_QUANTITY_SOLD FROM ECOMMERCE;

/*write a SQL Query 
 to find get  the total number of transactions */

SELECT COUNT(*) AS TOTAL_TRANSACTIONS FROM ECOMMERCE;

 /*write a SQL Query
 to find  get the Latest transaction date in the table */

SELECT MAX(PURCHASE_DATE) AS LATEST_DATE FROM ECOMMERCE;

/* write a SQL Query
to find  the total sales revenue for transactions in a specific country */

SELECT SUM(PRICE * QUANTITY) AS TOTAL_REVENUE FROM ECOMMERCE WHERE COUNTRY = 
'"United Kingdom"';

/* write a SQL Query
to find country the transactions made by a specific customer.*/
SELECT COUNTRY FROM ECOMMERCE WHERE CUSTOMERNO = 15098 and rownum<10;

/*write a SQL Query
to find productname the latest transaction.*/
SELECT PRODUCTNAME FROM ECOMMERCE WHERE PURCHASE_DATE = (SELECT MAX(PURCHASE_DATE) FROM ECOMMERCE) and rownum<10;

/*write a SQL Query 
to find the highest-priced product.*/
SELECT PRODUCTNAME
FROM ECOMMERCE WHERE PRICE = (SELECT MAX(PRICE) FROM ECOMMERCE) and rownum<10;
