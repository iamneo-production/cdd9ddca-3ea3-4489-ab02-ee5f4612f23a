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
FROM ecommerce
WHERE substr(PURCHASE_DATE, 1,4) = '2019' GROUP BY substr(PURCHASE_DATE, 6,2), productname;

/*  count the customers from each country   */

select count(CUSTOMERNO) as total_customers,COUNTRY
from ECOMMERCE
group by country;

/*  unique product names sold from each year    */

select distinct(productname),substr(PURCHASE_DATE, 1,4) AS year
from ECOMMERCE;