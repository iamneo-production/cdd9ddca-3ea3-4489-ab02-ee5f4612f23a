

SET TIMING ON ;
SELECT COUNT(*) FROM ECOMMERCE WHERE substr(purchase_date,6,2) =02 AND substr(purchase_date,1,4) =2019;


SELECT substr(purchase_date,1,4),SUM(PRICE * QUANTITY) FROM ECOMMERCE GROUP BY substr(purchase_date,1,4);


SELECT substr(purchase_date,6,2),SUM(PRICE * QUANTITY) FROM ECOMMERCE  WHERE substr(purchase_date,1,4)=2019
GROUP BY substr(purchase_date,6,2) ORDER BY substr(purchase_date,6,2) ASC;

SELECT COUNTRY,COUNT(*) FROM ECOMMERCE GROUP BY COUNTRY;

SELECT DISTINCT PRODUCTNAME,substr(purchase_date,1,4) AS YEAR FROM ECOMMERCE 
GROUP BY PRODUCTNAME,substr(purchase_date,1,4) ORDER BY substr(purchase_date,1,4) ASC;
