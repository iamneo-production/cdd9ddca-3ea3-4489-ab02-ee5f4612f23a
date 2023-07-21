/*   sql query to find how many products were sold in february 2019     */
select count(productno) total_poducts
from ecommerce
where purchase_date between '2019-02-01' and '2019-02-28';