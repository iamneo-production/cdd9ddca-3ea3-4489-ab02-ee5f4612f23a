set timing on;

--EXTRA QUERIES--

--6.Write a sql query to count the customers from each year?--

select count(CUSTOMERNO) as customers_count,substr(purchase_date,1,4) as year from ecommerce 
group by substr(purchase_date,1,4);

--7.Write a sql query to display the order details of who are all ordered from country Australia?--

select PRODUCTNAME from ecommerce where country='"Australia"';

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