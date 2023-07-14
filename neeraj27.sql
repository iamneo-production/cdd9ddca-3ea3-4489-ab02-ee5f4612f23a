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