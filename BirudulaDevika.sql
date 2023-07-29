/* Write a SQL query to how many products were sold in february 2019? */
select count(*) as products_sold
from ecommerce where substr(purchase_date,1,4)='2019' and
substr(purchase_date,6,2)='02';

/* Write a sql query to total sale amount in each year? */
select substr(purchase_date,1,4) as years,sum(price*quantity) as total_sale_amount
from ecommerce
group by substr(purchase_date,1,4);

/* Write a sql query to what was the total sale amount of each product on a month-wise basis 
in the year 2019*/
select substr(purchase_date,6,2) as months,productname, sum(price*quantity) as total_sale_amount
from ecommerce where substr(purchase_date,1,4)='2019'
group by substr(purchase_date,6,2), productname;

/* Write a sql query to count the customers from each country? */
select country,count(*) as no_of_customers from ecommerce
group by country;

/* Write a sql queryto list all the unique product name sold from each year?*/
select substr(purchase_date,1,4) as years, productname
from ecommerce
group by substr(purchase_date,1,4),productname;

/* ecommerce*/

