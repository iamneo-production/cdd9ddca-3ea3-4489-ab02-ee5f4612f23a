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

