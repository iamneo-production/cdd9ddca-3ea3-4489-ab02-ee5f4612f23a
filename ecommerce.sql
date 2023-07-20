select *
from ecommerce;

desc ecommerce

select count(PRODUCTNO) AS TOTAL_PRODUCTS
from ECOMMERCE
where PURCHASE_DATE between '01-02-2019' and '28-02-2019';