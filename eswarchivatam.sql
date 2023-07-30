SET TIMING ON;
/*
SELECT COUNT(*) FROM ECOMMERCE WHERE MON_FIELD =02 AND YEAR_FIELD =2019;
SELECT YEAR_FIELD,SUM(PRICE) FROM ECOMMERCE GROUP BY YEAR_FIELD;

SELECT MON_FIELD,SUM(PRICE) FROM ECOMMERCE  WHERE YEAR_FIELD=2019 GROUP BY MON_FIELD ORDER BY MON_FIELD;
SELECT COUNTRY,COUNT(*) FROM ECOMMERCE GROUP BY COUNTRY;

SELECT DISTINCT PRODUCTNAME,YEAR_FIELD AS YEAR FROM ECOMMERCE 
GROUP BY PRODUCTNAME,YEAR_FIELD ORDER BY YEAR_FIELD;
select * from SALES;
select * from ECOMMERCE;
DESC ECOMMERCE;
SELECT * FROM ECOMMERCE;

*/

/*
SET TIMING ON ;
SELECT COUNT(*) FROM ECOMMERCE WHERE substr(purchase_date,6,2) =02 AND substr(purchase_date,1,4) =2019;

EXPLAIN PLAN FOR SELECT COUNT(*) FROM ECOMMERCE WHERE substr(purchase_date,6,2) =02 AND substr(purchase_date,1,4) =2019;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());

SELECT substr(purchase_date,1,4),SUM(PRICE * QUANTITY) FROM ECOMMERCE GROUP BY substr(purchase_date,1,4);
CREATE INDEX 
EXPLAIN PLAN FOR   
SELECT substr(purchase_date,1,4),SUM(PRICE) FROM ECOMMERCE GROUP BY substr(purchase_date,1,4);
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());


SELECT substr(purchase_date,6,2),SUM(PRICE * QUANTITY) FROM ECOMMERCE  WHERE substr(purchase_date,1,4)=2019
GROUP BY substr(purchase_date,6,2) ORDER BY substr(purchase_date,6,2);
EXPLAIN PLAN FOR SELECT substr(purchase_date,6,2),SUM(PRICE) FROM ECOMMERCE  WHERE substr(purchase_date,1,4)=2019
GROUP BY substr(purchase_date,6,2) ORDER BY substr(purchase_date,6,2);
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());

SELECT COUNTRY,COUNT(*) FROM ECOMMERCE GROUP BY COUNTRY;
EXPLAIN PLAN FOR 
SELECT COUNTRY,COUNT(*) FROM ECOMMERCE GROUP BY COUNTRY;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());

SELECT DISTINCT PRODUCTNAME,substr(purchase_date,1,4) AS YEAR FROM ECOMMERCE 
GROUP BY PRODUCTNAME,substr(purchase_date,1,4) ORDER BY substr(purchase_date,1,4);
CREATE INDEX PRODUCTNAME_PURCHASE_DATE_IDX ON ECOMMERCE(PRODUCTNAME,PURCHASE_DATE);
EXPLAIN PLAN FOR
SELECT DISTINCT PRODUCTNAME,substr(purchase_date,1,4) AS YEAR FROM ECOMMERCE 
GROUP BY PRODUCTNAME,substr(purchase_date,1,4) ORDER BY substr(purchase_date,1,4);
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY()); 
*/

SET TIMING ON ;

/* 1.Write a SQL Query to How many products were sold in February 2019? */
SELECT COUNT(*) FROM ECOMMERCE WHERE substr(purchase_date,6,2) =02 AND substr(purchase_date,1,4) =2019;

/* 2.Write a SQL Query to Total sale amount in each year? */
SELECT substr(purchase_date,1,4),SUM(PRICE * QUANTITY) FROM ECOMMERCE GROUP BY substr(purchase_date,1,4);

/* 3.Write a SQL Query to What was the total sales amount of each product on a month-wise basis in the year 2019?*/
SELECT substr(purchase_date,6,2),SUM(PRICE * QUANTITY) FROM ECOMMERCE  WHERE substr(purchase_date,1,4)=2019
GROUP BY substr(purchase_date,6,2) ORDER BY substr(purchase_date,6,2);

/*4.Write a SQL Query to Count the Customers from each country? */
SELECT COUNTRY,COUNT(*) FROM ECOMMERCE GROUP BY COUNTRY;

/*  5.Write a SQL Query to List all the unique product names sold from each year?*/
SELECT DISTINCT PRODUCTNAME,substr(purchase_date,1,4) AS YEAR FROM ECOMMERCE 
GROUP BY PRODUCTNAME,substr(purchase_date,1,4) ORDER BY substr(purchase_date,1,4);
