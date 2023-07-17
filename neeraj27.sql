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

/* tried to do partition but it is showing error*/
ALTER TABLE ecommerce
PARTITION BY LIST (country)
(
  PARTITION p_usa VALUES IN ('Netherlands'),
  PARTITION p_uk VALUES IN ('Portugal'),
  PARTITION p_france VALUES IN ('Australia'),
  PARTITION p_germany VALUES IN ('Germany'),
  PARTITION p_other VALUES IN (DEFAULT)
);

/* trying out more queries other than the given five*/

/*query to retreive first five rows*/
select * from ecommerce where rownum<=5;

/*Query to Get the total number of transactions.*/
SELECT COUNT(*) FROM ECOMMERCE;

/*Query Find the transactions made on 2019-02-1.*/
SELECT * FROM ECOMMERCE WHERE PURCHASE_DATE = '2019-02-1';

/*Query to Find the transactions with a specific product name*/
SELECT * FROM ECOMMERCE WHERE PRODUCTNAME = 'Heart Of Wicker Large';

/*Query to Calculate the total revenue from all transactions.*/
SELECT SUM(PRICE * QUANTITY) AS TotalRevenue FROM ECOMMERCE;

/*Query to Get the average price of products sold.*/
SELECT AVG(PRICE) AS AveragePrice FROM ECOMMERCE;

/*Query to Find the transactions with a quantity greater than a certain value.*/
SELECT * FROM ECOMMERCE WHERE QUANTITY > 10;

/*Query to Retrieve transactions from a specific country.*/
SELECT * FROM ECOMMERCE WHERE COUNTRY = 'United Kingdom';

/*Query to Find the highest-priced product.*/
SELECT * FROM ECOMMERCE WHERE PRICE = (SELECT MAX(PRICE) FROM ECOMMERCE);

/*Query to Get the total quantity of a specific product sold.*/
SELECT SUM(QUANTITY) AS TotalQuantity FROM ECOMMERCE WHERE PRODUCTNO = "22502";

/*Find the customers who made purchases above a certain price.*/
SELECT * FROM ECOMMERCE WHERE PRICE > 1000 AND CUSTOMERNO IN (SELECT DISTINCT CUSTOMERNO FROM ECOMMERCE);

/*Query to Retrieve the transactions made by a specific customer.*/
SELECT * FROM ECOMMERCE WHERE CUSTOMERNO = 15098;

/*Find the transactions within a specific price range.*/
SELECT * FROM ECOMMERCE WHERE PRICE BETWEEN 50 AND 100;

/*Calculate the average quantity of products sold per transaction.*/
SELECT AVG(QUANTITY) AS AverageQuantity FROM ECOMMERCE;

/*Query to Retrieve the latest transaction.*/
SELECT * FROM ECOMMERCE WHERE PURCHASE_DATE = (SELECT MAX(PURCHASE_DATE) FROM ECOMMERCE);

/*Query to Find the transactions with a specific product number and quantity greater than 5.*/
SELECT * FROM ECOMMERCE WHERE PRODUCTNO = '22114' AND QUANTITY > 5;

/*Query to Calculate the total revenue generated from a specific country.*/
SELECT SUM(PRICE * QUANTITY) AS TotalRevenue FROM ECOMMERCE WHERE COUNTRY = 'United Kingdom';

/*Query to Retrieve transactions made between two specific dates.*/
SELECT * FROM ECOMMERCE WHERE PURCHASE_DATE BETWEEN '2019-06-30' AND '2019-10-30';

/*Query to Find the customers who made purchases of a specific product.*/
SELECT DISTINCT CUSTOMERNO FROM ECOMMERCE WHERE PRODUCTNO = '21934';

/*Query to Get the transactions sorted in descending order of price.*/
SELECT * FROM ECOMMERCE ORDER BY PRICE DESC;