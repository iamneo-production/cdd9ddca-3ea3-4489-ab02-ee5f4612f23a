--SQL QUERY TO KNOW HOW MANY PRODUCTS WERE SOLD IN FEBRFEBRUARY 2019
SELECT SUM(QUANTITY) AS TOTAL_PRODUCTS_SOLD from ECOMMERCE
WHERE PURCHASE_DATE>='2019-02-01' and PURCHASE_DATE<'2019-03-01';

--SQL QUERY TO GET TOTAL SALE AMOUNT IN EACH YEAR
SELECT
    EXTRACT(YEAR FROM TO_DATE(PURCHASE_DATE,'YYYY-MM-DD')) AS SALES_YEAR,
    SUM(PRICE*QUANTITY) AS TOTAL_SALE_AMOUNT 
FROM ECOMMERCE GROUP BY EXTRACT(YEAR FROM TO_DATE(PURCHASE_DATE,'YYYY-MM-DD'));

--SQL QUERY TO GET WHAT WAS THE TOTAL SALES AMOUNT OF EACH PRODUCT ON A MONTH-WISE 
--BASIS IN THE YEAR 2019
SELECT 
   EXTRACT(YEAR FROM TO_DATE(PURCHASE_DATE,'YYYY-MM-DD')) AS SALES_YEAR,
    EXTRACT(MONTH FROM TO_DATE(PURCHASE_DATE,'YYYY-MM-DD')) AS SALES_MONTH,
    PRODUCTNO AS PRODUCT_NUMBER,
    SUM(PRICE*QUANTITY) AS TOTAL_SALES_AMOUNT
FROM ECOMMERCE WHERE PURCHASE_DATE>='2019-01-01' AND PURCHASE_DATE<'2020-01-01'
GROUP BY EXTRACT(YEAR FROM TO_DATE(PURCHASE_DATE,'YYYY-MM-DD')),
EXTRACT(MONTH FROM TO_DATE(PURCHASE_DATE,'YYYY-MM-DD')),PRODUCTNO;

--SQL QUERY TO COUNT THE CUSTOMERS FROM EACH COUNTRY
SELECT COUNTRY,COUNT(*) AS CUSTOMER_COUNT FROM ECOMMERCE
GROUP BY COUNTRY;

--SQL QUERY TO LIST ALL THE UNIQUE PRODUCT NAMES SOLD FROM EACH YEAR
SELECT EXTRACT(YEAR FROM TO_DATE(PURCHASE_DATE,'YYYY-MM-DD')) AS SALES_YEAR,
PRODUCTNAME AS PRODUCT_NAME
FROM ECOMMERCE 
GROUP BY EXTRACT(YEAR FROM TO_DATE(PURCHASE_DATE,'YYYY-MM-DD')),PRODUCTNAME;

 
