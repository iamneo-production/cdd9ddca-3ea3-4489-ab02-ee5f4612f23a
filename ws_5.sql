/* how many products where sold in the year 2019* --------niha*/
select count(PRODUCTNAME) as total_products from ECOMMERCE where YEAR_FIELD=2019 and MON_FIELD=2;

/*total sale amount in each year*-------niha*/
select sum(PRICE*QUANTITY) as total_salesamount, YEAR_FIELD from ECOMMERCE group by YEAR_FIELD;

/*to count the customers from each country*--------------niha*/
select count(CUSTOMERNO), country from ECOMMERCE group by country;
select count(CUSTOMERNO) FROM ECOMMERCE group by COUNTRY;

/* list all the unique product names sold from each year*----------niha*/
select DISTINCT(PRODUCTNAME), YEAR_FIELD from ECOMMERCE;
select DISTINCT(PRODUCTNAME), YEAR_FIELD from ECOMMERCE order by PRODUCTNAME, YEAR_FIELD;

/* total sales amount of each product on a month basis in year 2019*------niha*/
select PRODUCTNAME, sum(PRICE*QUANTITY),MON_FIELD from ECOMMERCE where YEAR_FIELD=2019 group by PRODUCTNAME,MON_FIELD;