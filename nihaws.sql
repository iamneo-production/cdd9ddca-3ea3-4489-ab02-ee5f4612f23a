/* how many products were sold in feb 2019*/
select count(PRODUCTNAME) sold_products from ECOMMERCE where PURCHASE_DATE like '2019-02-%';

/*total sales amount in each year*/
select sum(PRICE*QUANTITY) as total_salesamount from ECOMMERCE group by substr(PURCHASE_DATE,1,4);
select sum(PRICE*QUANTITY) as total_salesamount, substr(PURCHASE_DATE,1,4) Yearly from ECOMMERCE group by substr(PURCHASE_DATE,1,4);

/*total sales amount of each product on month basis in year 2019*/

select PRODUCTNAME, sum(PRICE*QUANTITY) total_salesamount, substr(PURCHASE_DATE,6,2) monthwise from ECOMMERCE where PURCHASE_DATE like '2019-%' group by PRODUCTNAME, substr(PURCHASE_DATE,6,2); 
select sum(PRICE*QUANTITY) total_salesamount from ECOMMERCE where PURCHASE_DATE like '2019-%' group by PRODUCTNAME, substr(PURCHASE_DATE,6,2);

/*count the customers from each country*/
select count(CUSTOMERNO) total_customers, COUNTRY from ECOMMERCE group by COUNTRY;
select count(CUSTOMERNO) total_customers from ECOMMERCE group by COUNTRY;

/*unique product names sold each year*/
select distinct(PRODUCTNAME), substr(PURCHASE_DATE,1,4) yearly_basis from ECOMMERCE;