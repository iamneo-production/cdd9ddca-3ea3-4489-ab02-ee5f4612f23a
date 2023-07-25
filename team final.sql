---------------------------------------Manikanta-------------------------------------------------------------

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


---------------------------------------------Niharika----------------------------------------------------------------

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


--------------------------------------Neeraj chekuri--------------------------------------------------

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



------------------------------------Susmitha-------------------------------------------------------------------------------------------------------

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



---------------------------------------------------Saikumar Bodhas------------------------------------------------


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




------------------------------------------Birudula Devika-----------------------------------------------------------------------


select count(*) as products_sold
from ecommerce where substr(purchase_date,1,4)='2019' and
substr(purchase_date,6,2)='02';

select substr(purchase_date,1,4) as years, sum(price*quantity) as total_sale_amount
from ecommerce
group by substr(purchase_date,1,4);

select substr(purchase_date,6,2) as months,productname, sum(price*quantity) as total_sale_amount
from ecommerce where substr(purchase_date,1,4)='2019'
group by substr(purchase_date,6,2), productname;

select country,count(*) as no_of_customers from ecommerce
group by country;

select substr(purchase_date,1,4) as years, productname
from ecommerce
group by substr(purchase_date,1,4),productname;



------------------------------------------Varaprasad---------------------------------------------------------------------------


select count(*) as products_sold from ecommerce where substr(purchase_date,1,4)='2019' and 
substr(purchase_date,6,2)='02';

select substr(purchase_date,1,4) as years,sum(price*quantity) as total_sale_amount from ecommerce 
group by substr(purchase_date,1,4);

select substr(purchase_date,6,2) as months,productname,sum(price*quantity) as total_sale_amount from ecommerce 
where substr(purchase_date,1,4)='2019' group by substr(purchase_date,6,2), productname;

select country,count(*) as no_of_customers from ecommerce group by country;

select substr(purchase_date,1,4) as years,productname from ecommerce group by substr(purchase_date,1,4), productname;