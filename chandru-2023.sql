-- sql query to find how many products were sold in february 2019

<<<<<<< HEAD
SELECT count(productno) total_products
FROM ecommerce
=======
SELECT count(productno) AS total_products
FROM ECOMMERCE
>>>>>>> Oracle-Workspace-chandru-2023
WHERE purchase_date between '2019-02-01' and '2019-02-28';

-- sql query to find total sale amount in each year

SELECT substr(PURCHASE_DATE, 1,4) AS year, sum(price) AS total_sales_amount
FROM ECOMMERCE
GROUP BY substr(PURCHASE_DATE, 1,4);

-- total sales amount of each product on a month-wise basis in the year 2019

SELECT  productname, SUM(price*quantity) AS total_sales_amount,substr(PURCHASE_DATE, 6,2) AS month
FROM ECOMMERCE
WHERE substr(PURCHASE_DATE, 1,4) = '2019' GROUP BY substr(PURCHASE_DATE, 6,2), productname;

-- count the customers from each country

SELECT count(CUSTOMERNO) AS total_customers,COUNTRY
FROM ECOMMERCE
GROUP BY country;

-- unique product names sold from each year

SELECT distinct(productname),substr(PURCHASE_DATE, 1,4) AS year
FROM ECOMMERCE;