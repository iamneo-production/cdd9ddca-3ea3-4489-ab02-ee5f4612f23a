<<<<<<< HEAD
--select * from ecommerce;
set timing on;
--1.Write a sql query to how many products were sold in February 2019?--

select count(PRODUCTNO) as products_sold_FEB2019 from ECOMMERCE where PURCHASE_DATE like '2019-02-%';
=======
--1.Write a sql query to how many products were sold in February 2019?--

select count(*) as products_sold_FEB2019 from ECOMMERCE where PURCHASE_DATE>='2019-02-01' and PURCHASE_DATE<'2019-03-01';
>>>>>>> main

--2.Write a sql query to total sale amount in each year?--

select SUBSTR(PURCHASE_DATE,1,4) as Year,sum(PRICE*QUANTITY) as Total_Sale from ECOMMERCE 
group by substr(PURCHASE_DATE,1,4);

<<<<<<< HEAD
--Another query

SELECT SUM(PRICE*QUANTITY) AS TOTAL,substr(PURCHASE_DATE,1,4) as Year FROM ECOMMERCE WHERE PURCHASE_DATE LIKE '201%' 
GROUP BY SUBSTR(PURCHASE_DATE,1,4);

=======
>>>>>>> main
--3.Write a sql Query to what was the total sales amount of each product on a month-wise basis in the year 2019?--

select substr(PURCHASE_DATE,6,2) as Month,PRODUCTNAME,sum(price*quantity) as Total_Sales from ECOMMERCE
where substr(PURCHASE_DATE,1,4)='2019' Group by substr(PURCHASE_DATE,6,2),PRODUCTNAME;

<<<<<<< HEAD
--4.write a sql quert to count the customers from each country?--
=======

--4.write a sql query to count the customers from each country?--
>>>>>>> main

select count(CUSTOMERNO) as CUSTOMER_COUNT, country from ECOMMERCE 
group by country order by CUSTOMER_COUNT desc; 

--5.Write a sql query to List all the unique product names sold from each year?--

SELECT SUBSTR(PURCHASE_DATE,1,4) AS YEAR,PRODUCTNAME FROM ECOMMERCE GROUP BY SUBSTR(PURCHASE_DATE,1,4),PRODUCTNAME;

