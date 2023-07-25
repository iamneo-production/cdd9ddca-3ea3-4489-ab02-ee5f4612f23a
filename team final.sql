--------------------Manikanta-----------------------

set timing on;

--1.Write a sql query to how many products were sold in February 2019?--

select count(PRODUCTNO) as products_sold_FEB2019 from ECOMMERCE where PURCHASE_DATE like '2019-02-%';

--2.Write a sql query to total sale amount in each year?--

select SUBSTR(PURCHASE_DATE,1,4) as Year,sum(PRICE*QUANTITY) as Total_Sale from ECOMMERCE 
group by substr(PURCHASE_DATE,1,4);

--Another query

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

--EXTRA QUERIES

--6.Write a sql query to count the customers from each year?--

select count(CUSTOMERNO) as customers_count,substr(purchase_date,1,4) as year from ecommerce 
group by substr(purchase_date,1,4);

--7.Write a sql query to find total sale amount of each product in the year 2019?--

select sum(price*quantity) as Amount,PRODUCTNAME,purchase_date from ecommerce where substr(purchase_date,1,4)='2019'
group by substr(purchase_date,1,4), PRODUCTNAME,purchase_date;

--8.Write a sql query to display the order details of who are all ordered from country Australia?--

select * from ecommerce where country='"Australia"';

--9.Write a sql query to display the country name in ascending order?--

select distinct(Country) from ecommerce order by country ASC;

--10.Write a sql query to display the product list the price is above 2.01?--

select PRODUCTNAME,PRICE from ecommerce where price>2.01 order by price asc;

--11.Write a sql query to display all unique products in descending order?--

select distinct(PRODUCTNAME) from ECOMMERCE order by productname desc;

--12.Write a sql query to find which product is maximum purchased?--

select max(PRODUCTNAME) from ecommerce;

--13.Write a sql query to find which product is minimum purchased?--

select min(PRODUCTNAME) from ECOMMERCE;

--14.Write a sql Query to find Average of the Products?--

select Avg(price) as Average from ecommerce;

--15.Write a sql query to find total number of Products?--

select count(PRODUCTNAME) as Total_Products from ecommerce;


-----------------Niharika----------------------------------------------------------------


set timing on;

/* 1.how many products were sold in feb 2019*/
select count(PRODUCTNAME) sold_products from ECOMMERCE where PURCHASE_DATE like '2019-02-%';

/* 2.total sales amount in each year*/
select sum(PRICE*QUANTITY) as total_salesamount from ECOMMERCE group by substr(PURCHASE_DATE,1,4);
select sum(PRICE*QUANTITY) as total_salesamount, substr(PURCHASE_DATE,1,4) Yearly from ECOMMERCE group by substr(PURCHASE_DATE,1,4);

/* 3.total sales amount of each product on month basis in year 2019*/
select PRODUCTNAME, sum(PRICE*QUANTITY) total_salesamount, substr(PURCHASE_DATE,6,2) monthwise from ECOMMERCE where PURCHASE_DATE like '2019-%' group by PRODUCTNAME, substr(PURCHASE_DATE,6,2); 
select sum(PRICE*QUANTITY) total_salesamount from ECOMMERCE where PURCHASE_DATE like '2019-%' group by PRODUCTNAME, substr(PURCHASE_DATE,6,2);

/* 4.count the customers from each country*/
select count(CUSTOMERNO) total_customers, COUNTRY from ECOMMERCE group by COUNTRY;
select count(CUSTOMERNO) total_customers from ECOMMERCE group by COUNTRY;

/* 5.unique product names sold each year*/
select distinct(PRODUCTNAME), substr(PURCHASE_DATE,1,4) yearly_basis from ECOMMERCE group by substr(PURCHASE_DATE,1,4), PRODUCTNAME;



/*-----------------Additional queries------------------*/
/*1.Find all transactions made on a particular date*/
SELECT * FROM ecommerce WHERE purchase_date = '2019-02-02';

/*2.Get the total number of transactions*/
SELECT COUNT(*) AS TotalTransactions FROM ecommerce;

/*3.transactions with a price greater than a specific value*/
SELECT * FROM ecommerce WHERE Price>=1.94;

/*4.the total revenue generated from all transactions*/
SELECT SUM(Price * Quantity) AS TotalRevenue FROM ecommerce;

/*5.the transactions with a quantity greater than a specific value*/
SELECT * FROM ecommerce WHERE Quantity >12;

/*6.Retrieve the latest transaction made*/
SELECT * FROM ecommerce ORDER BY purchase_date DESC
FETCH FIRST 1 ROW ONLY;

/*7.Get the average price of all transactions*/
SELECT AVG(Price) AS AveragePrice FROM ecommerce;

/*8.Find the transactions with a specific transaction number and customer number*/
SELECT * FROM ecommerce WHERE Transactionno = '536384'
  AND Customerno = 16029;

/*9.display table ecommerce*/
select * from ecommerce;

/*10.display productname in desc order*/
select productname from ecommerce order by productname desc;

/*11.display productname in alphabetical order*/
select productname from ecommerce order by productname;

/*12. max productname */
select max(PRODUCTNAME) from ECOMMERCE;

/*13.display unique customerno*/
select distinct(CUSTOMERNO) from ECOMMERCE;

/*14. Between operator */
select PRODUCTNAME from ECOMMERCE where PRICE between 1.88 and 2.14;

/* 15.IN operator*/
SELECT * from ECOMMERCE where QUANTITY in (2,4,6);



---------------------------Neeraj chekuri----------------------------------------

/*
sql query to find how many products were sold
 in febraury 2019
 */
set timing on;
select count(*) as products_sold from ecommerce where substr(purchase_date,1,4)='2019' and 
substr(purchase_date,6,2)='02';

/*
it 18 milliseconds let us try adding index on purchase_date
*/
create index purchase_date_index on ecommerce(purchase_date);
/*
it is showing already index is added on purchase_date column. so let us know on what columns index exists
*/
SELECT INDEX_NAME, COLUMN_NAME
FROM USER_IND_COLUMNS
WHERE TABLE_NAME = 'ECOMMERCE';

/*
sql query to find total sale amount in each year
*/

select substr(purchase_date,1,4) as years,sum(price*quantity) as total_sale_amount from ecommerce 
group by substr(purchase_date,1,4);

/*
query to know what was the total sales amount of each product on a month wise basis in the year 2019
*/
select substr(purchase_date,6,2) as months,productname,sum(price*quantity) as total_sale_amount from ecommerce 
where substr(purchase_date,1,4)='2019' group by substr(purchase_date,6,2), productname;

/*
query to count the customers from each country
*/
select country,count(*) as no_of_customers from ecommerce group by country;

/*
 query to get all unique product names sold from each year
 */
select substr(purchase_date,1,4) as years,productname from ecommerce group by substr(purchase_date,1,4), productname;



------------------------Susmitha-------------------------------------------------------------------------------------------------------

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

-- 7.Retrieve transactions where the quantity is less than 10.

SELECT * FROM ECOMMERCE WHERE QUANTITY < 10;

-- 8.Get the most expensive product sold.

SELECT DISTINCT(PRODUCTNAME) FROM ECOMMERCE WHERE PRICE = (SELECT MAX(PRICE) FROM ECOMMERCE);

-- 9.Get the  products with the sales revenue IN DECREASING order.

SELECT PRODUCTNO, SUM(PRICE * QUANTITY) AS TOTAL_REVENUE FROM ECOMMERCE GROUP BY PRODUCTNO ORDER BY TOTAL_REVENUE ;

-- 10.Get the average price of products sold.

SELECT AVG(PRICE) AS AVERAGE_PRICE FROM ECOMMERCE;

-- 11.Get the maximum quantity sold in a single transaction.

SELECT MAX(QUANTITY) AS MAX_QUANTITY_SOLD FROM ECOMMERCE;

-- 12. Retrieve transactions where the customer number is null.

SELECT * FROM ECOMMERCE WHERE CUSTOMERNO IS NULL;

-- 13.Get the total number of transactions.

SELECT COUNT(*) AS TOTAL_TRANSACTIONS FROM ECOMMERCE;

-- 14.Retrieve transactions where the price is greater than 100.

SELECT * FROM ECOMMERCE WHERE PRICE > 100;

-- 15.Get the Latest transaction date in the table.

SELECT MAX(PURCHASE_DATE) AS LATEST_DATE FROM ECOMMERCE;

-- 16.Get the total quantity sold for each product.

SELECT PRODUCTNO, SUM(QUANTITY) AS TOTAL_QUANTITY FROM ECOMMERCE GROUP BY PRODUCTNO;

-- 17.Get the total sales revenue for transactions in a specific country.

SELECT SUM(PRICE * QUANTITY) AS TOTAL_REVENUE FROM ECOMMERCE WHERE COUNTRY = '"United Kingdom"';

-- 18.Retrieve transactions where the product name starts with "A"

SELECT * FROM ECOMMERCE WHERE PRODUCTNAME LIKE '"A%';

-- 19.Retrieve transactions where the product name ends with "book".

SELECT * FROM ECOMMERCE WHERE PRODUCTNAME LIKE '%book"';

--20. Retrieve transactions where the product name contains "Holder".

SELECT * FROM ECOMMERCE WHERE PRODUCTNAME LIKE '%Holder%';

--21. Retrieve transactions with a price greater than the average price.

SELECT * FROM ECOMMERCE WHERE PRICE > (SELECT AVG(PRICE) FROM ECOMMERCE);

--22. Retrieve transactions where the quantity is not equal to 0.

SELECT * FROM ECOMMERCE WHERE QUANTITY <> 0;

--23. Retrieve transactions where the country is either "United States" or "Canada".

SELECT * FROM ECOMMERCE WHERE COUNTRY IN ('"United States"', '"Canada"');

--24. Retrieve transactions where the quantity sold is the same as the price.

SELECT * FROM ECOMMERCE WHERE QUANTITY = PRICE;

--25. Retrieve transactions where the price is a whole number (no decimal places).

SELECT * FROM ECOMMERCE WHERE PRICE = ROUND(PRICE);


------------------------------------Saikumar Bodhas--------------------------------------------


--SQL QUERY TO KNOW HOW MANY PRODUCTS WERE SOLD IN FEBRFEBRUARY 2019
SELECT SUM(QUANTITY) AS TOTAL_PRODUCTS_SOLD from ECOMMERCE
WHERE PURCHASE_DATE>='2019-02-01' and PURCHASE_DATE<'2019-03-01';

--SQL QUERY TO GET TOTAL SALE AMOUNT IN EACH YEAR
SELECT
    EXTRACT(YEAR FROM TO_DATE(PURCHASE_DATE,'YYYY-MM-DD')) AS SALES_YEAR,
    SUM(PRICE*QUANTITY) AS TOTAL_SALE_AMOUNT 
FROM ECOMMERCE GROUP BY EXTRACT(YEAR FROM TO_DATE(PURCHASE_DATE,'YYYY-MM-DD'));

--SQL QUERY TO GET WHAT WAS THE TOTAL SALES AMOUNT OF EACH PRODUCT ON A MONTH-WISE 
--BASIS IN THE YEAR 2019
SELECT 
   EXTRACT(YEAR FROM TO_DATE(PURCHASE_DATE,'YYYY-MM-DD')) AS SALES_YEAR,
    EXTRACT(MONTH FROM TO_DATE(PURCHASE_DATE,'YYYY-MM-DD')) AS SALES_MONTH,
    PRODUCTNO AS PRODUCT_NUMBER,
    SUM(PRICE*QUANTITY) AS TOTAL_SALES_AMOUNT
FROM ECOMMERCE WHERE PURCHASE_DATE>='2019-01-01' AND PURCHASE_DATE<'2020-01-01'
GROUP BY EXTRACT(YEAR FROM TO_DATE(PURCHASE_DATE,'YYYY-MM-DD')),
EXTRACT(MONTH FROM TO_DATE(PURCHASE_DATE,'YYYY-MM-DD')),PRODUCTNO;

--SQL QUERY TO COUNT THE CUSTOMERS FROM EACH COUNTRY
SELECT COUNTRY,COUNT(*) AS CUSTOMER_COUNT FROM ECOMMERCE
GROUP BY COUNTRY;

--SQL QUERY TO LIST ALL THE UNIQUE PRODUCT NAMES SOLD FROM EACH YEAR
SELECT EXTRACT(YEAR FROM TO_DATE(PURCHASE_DATE,'YYYY-MM-DD')) AS SALES_YEAR,
PRODUCTNAME AS PRODUCT_NAME
FROM ECOMMERCE 
GROUP BY EXTRACT(YEAR FROM TO_DATE(PURCHASE_DATE,'YYYY-MM-DD')),PRODUCTNAME;



 -----------------------------Chandru-----------------------------------------------------


 /*   sql query to find how many products were sold in february 2019     */

select count(productno) total_products
from ecommerce
where purchase_date between '2019-02-01' and '2019-02-28';

/*  sql query to find total sale amount in each year  */

select substr(PURCHASE_DATE, 1,4) AS year, sum(price) as total_sales_amount
from ECOMMERCE
GROUP BY substr(PURCHASE_DATE, 1,4);

/*  total sales amount of each product on a month-wise basis in the year 2019   */

SELECT  productname, SUM(price*quantity) AS total_sales_amount,substr(PURCHASE_DATE, 6,2) AS month
FROM ECOMMERCE 
WHERE substr(PURCHASE_DATE, 1,4) = '2019' GROUP BY substr(PURCHASE_DATE, 6,2), productname;

/*  count the customers from each country   */

select count(CUSTOMERNO) as total_customers,COUNTRY
from ECOMMERCE
group by country;

/*  unique product names sold from each year    */

select distinct(productname),substr(PURCHASE_DATE, 1,4) AS year
from ECOMMERCE;


------------------------------------------Eswar--------------------------------------------------------------------

------------------------------------------Birudula Devika-----------------------------------------------------------------------

------------------------------------------Varaprasad---------------------------------------------------------------------------