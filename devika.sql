select count(*) products_sold
from ecommerce where substr(purchase_date,1,4)='2019' and
substr(purchase_date,6,2)='02';

select substr(purchase_date,1,4) as years,sum(price*quantity) as total_sale_amount
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


