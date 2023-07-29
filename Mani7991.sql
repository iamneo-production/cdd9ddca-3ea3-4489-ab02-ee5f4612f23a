set timing on;

--1.Write a sql query to how many products were sold in February 2019?--

select count(PRODUCTNO) as products_sold_FEB2019 from ECOMMERCE where PURCHASE_DATE like '2019-02-%';

--2.Write a sql query to total sale amount in each year?--

select SUBSTR(PURCHASE_DATE,1,4) as Year,sum(PRICE*QUANTITY) as Total_Sale from ECOMMERCE 
group by substr(PURCHASE_DATE,1,4);

<<<<<<< HEAD
--Another query--
=======
--Another query
>>>>>>> main

SELECT SUM(PRICE*QUANTITY) AS TOTAL,substr(PURCHASE_DATE,1,4) as Year FROM ECOMMERCE WHERE PURCHASE_DATE LIKE '201%' 
GROUP BY SUBSTR(PURCHASE_DATE,1,4);

--3.Write a sql Query to what was the total sales amount of each product on a month-wise basis in the year 2019?--

select substr(PURCHASE_DATE,6,2) as Month,PRODUCTNAME,sum(price*quantity) as Total_Sales from ECOMMERCE
where substr(PURCHASE_DATE,1,4)='2019' Group by substr(PURCHASE_DATE,6,2),PRODUCTNAME;

--4.write a sql query to count the customers from each country?--

select count(CUSTOMERNO) as CUSTOMER_COUNT, country from ECOMMERCE 
group by country order by CUSTOMER_COUNT desc; 

--5.Write a sql query to List all the unique product names sold from each year?--

SELECT SUBSTR(PURCHASE_DATE,1,4) AS YEAR,PRODUCTNAME FROM ECOMMERCE GROUP BY SUBSTR(PURCHASE_DATE,1,4),PRODUCTNAME;

--EXTRA QUERIES--

--6.Write a sql query to count the customers from each year?--

select count(CUSTOMERNO) as customers_count,substr(purchase_date,1,4) as year from ecommerce 
group by substr(purchase_date,1,4);

--7.Write a sql query to display the order details of who are all ordered from country Australia?--

<<<<<<< HEAD
select * from ecommerce where country='"Australia"';
=======
select PRODUCTNAME from ecommerce where country='"Australia"';
>>>>>>> main

--8.Write a sql query to display the country name in ascending order?--

select distinct(Country) from ecommerce order by country ASC;

--9.Write a sql query to display the product list the price is above 2.01?--

select PRODUCTNAME,PRICE from ecommerce where price>2.01 order by price asc;

--10.Write a sql query to display all unique products in descending order?--

select distinct(PRODUCTNAME) from ECOMMERCE order by productname desc;

--11.Write a sql query to find which product is maximum purchased?--

select max(PRODUCTNAME) from ecommerce;

--12.Write a sql query to find which product is minimum purchased?--

select min(PRODUCTNAME) from ECOMMERCE;

--13.Write a sql Query to find Average of the Products?--

select Avg(price) as Average from ecommerce;

--14.Write a sql query to find total number of Products?--

select count(PRODUCTNAME) as Total_Products from ecommerce;