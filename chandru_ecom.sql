/*   sql query to find how many products were sold in february 2019     */

set timing on;
select count(productno) total_poducts
from ecommerce
where purchase_date between '2019-02-01' and '2019-02-28';

/*  sql query to find total sale amount in each year  */

set timing on;
select substr(PURCHASE_DATE, 1,4) AS year, sum(price) as total_sales_amount
from ECOMMERCE
GROUP BY substr(PURCHASE_DATE, 1,4);

/*  total sales amount of each product on a month-wise basis in the year 2019   */

set timing on;
SELECT  productname, SUM(price*quantity) AS total_sales_amount,substr(PURCHASE_DATE, 6,2) AS month 
FROM ECOMMERCE 
WHERE substr(PURCHASE_DATE, 1,4) = '2019' GROUP BY substr(PURCHASE_DATE, 6,2), productname;

/*  count the customers from each country   */

set timing on;
select count(CUSTOMERNO) as total_customers,COUNTRY
from ECOMMERCE
group by country;