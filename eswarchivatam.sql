
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
GROUP BY substr(purchase_date,6,2) ORDER BY substr(purchase_date,6,2);

/*4.Write a SQL Query
 to Count the Customers from each country? */
SELECT COUNTRY,COUNT(*) FROM ECOMMERCE GROUP BY COUNTRY;

/*  5.Write a SQL Query 
to List all the unique product names sold from each year?*/
SELECT DISTINCT PRODUCTNAME,substr(purchase_date,1,4) AS YEAR FROM ECOMMERCE 
GROUP BY PRODUCTNAME,substr(purchase_date,1,4) ORDER BY substr(purchase_date,1,4) ASC;
