-- SQL QUERY TO KNOW HOW MANY PRODUCTS WERE SOLD IN THE SPECIFIED DATE RANGE
SELECT SUM(QUANTITY) AS TOTAL_PRODUCTS_SOLD
FROM ECOMMERCE
WHERE SUBSTR(PURCHASE_DATE, 1, 7) = '2019-02';

-- SQL QUERY TO GET TOTAL SALE AMOUNT IN EACH YEAR
SELECT
    SUBSTR(PURCHASE_DATE, 1, 4) AS SALES_YEAR,
    SUM(PRICE * QUANTITY) AS TOTAL_SALE_AMOUNT 
FROM ECOMMERCE
GROUP BY SUBSTR(PURCHASE_DATE, 1, 4);


/*SQL QUERY TO GET WHAT WAS THE TOTAL SALES AMOUNT OF EACH PRODUCT ON A MONTH-WISE 
 BASIS IN THE SPECIFIED DATE RANGE*/
SELECT 
   SUBSTR(PURCHASE_DATE, 1, 4) AS SALES_YEAR,
   SUBSTR(PURCHASE_DATE, 6, 2) AS SALES_MONTH,
   PRODUCTNO AS PRODUCT_NUMBER,
   SUM(PRICE * QUANTITY) AS TOTAL_SALES_AMOUNT
FROM ECOMMERCE
WHERE SUBSTR(PURCHASE_DATE, 1, 4) = '2019'
GROUP BY SUBSTR(PURCHASE_DATE, 1, 4), SUBSTR(PURCHASE_DATE, 6, 2), PRODUCTNO;


-- SQL QUERY TO COUNT THE CUSTOMERS FROM EACH COUNTRY
SELECT COUNTRY, COUNT(*) AS CUSTOMER_COUNT
FROM ECOMMERCE
GROUP BY COUNTRY;


-- SQL QUERY TO LIST ALL THE UNIQUE PRODUCT NAMES SOLD FROM EACH YEAR
SELECT
    SUBSTR(PURCHASE_DATE, 1, 4) AS SALES_YEAR,
    PRODUCTNAME AS PRODUCT_NAME
FROM ECOMMERCE
GROUP BY SUBSTR(PURCHASE_DATE, 1, 4), PRODUCTNAME;
--
