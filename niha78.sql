set timing on;

-- 1.how many products were sold in feb 2019--
select count(PRODUCTNAME) sold_products from ECOMMERCE where PURCHASE_DATE like '2019-02-%';

-- 2.total sales amount in each year--
select sum(PRICE*QUANTITY) as total_salesamount from ECOMMERCE group by substr(PURCHASE_DATE,1,4);
select sum(PRICE*QUANTITY) as total_salesamount, substr(PURCHASE_DATE,1,4) Yearly from ECOMMERCE group by substr(PURCHASE_DATE,1,4);

-- 3.total sales amount of each product on month basis in year 2019--
select PRODUCTNAME, sum(PRICE*QUANTITY) total_salesamount, substr(PURCHASE_DATE,6,2) monthwise from ECOMMERCE where PURCHASE_DATE like '2019-%' group by PRODUCTNAME, substr(PURCHASE_DATE,6,2); 
select sum(PRICE*QUANTITY) total_salesamount from ECOMMERCE where PURCHASE_DATE like '2019-%' group by PRODUCTNAME, substr(PURCHASE_DATE,6,2);

-- 4.count the customers from each country--
select count(CUSTOMERNO) total_customers, COUNTRY from ECOMMERCE group by COUNTRY;
select count(CUSTOMERNO) total_customers from ECOMMERCE group by COUNTRY;

-- 5.unique product names sold each year--
select distinct(PRODUCTNAME), substr(PURCHASE_DATE,1,4) yearly_basis from ECOMMERCE group by substr(PURCHASE_DATE,1,4), PRODUCTNAME;



                    --Additional queries--
--1.Find all transactions made on a particular date--
SELECT * FROM ecommerce WHERE purchase_date = '2019-02-02';

--2.Get the total number of transactions--
SELECT COUNT(*) AS TotalTransactions FROM ecommerce;

--3.transactions with a price greater than a specific value--
SELECT * FROM ecommerce WHERE Price>=1.94;

--4.the total revenue generated from all transactions--
SELECT SUM(Price * Quantity) AS TotalRevenue FROM ecommerce;

--5.the transactions with a quantity greater than a specific value--
SELECT * FROM ecommerce WHERE Quantity >12;

--6.Retrieve the latest transaction made--
SELECT * FROM ecommerce ORDER BY purchase_date DESC
FETCH FIRST 1 ROW ONLY;

--7.Get the average price of all transactions--
SELECT AVG(Price) AS AveragePrice FROM ecommerce;

--8.Find the transactions with a specific transaction number and customer number--
SELECT * FROM ecommerce WHERE Transactionno = '536384'
  AND Customerno = 16029;

--9.display table ecommerce--
select * from ecommerce;

--10.display productname in desc order--
select productname from ecommerce order by productname desc;

--11.display productname in alphabetical order--
select productname from ecommerce order by productname;

--12. max productname--
select max(PRODUCTNAME) from ECOMMERCE;

--13.display unique customerno--
select distinct(CUSTOMERNO) from ECOMMERCE;

--14. Between operator --
select PRODUCTNAME from ECOMMERCE where PRICE between 1.88 and 2.14;

-- 15.IN operator--
SELECT * from ECOMMERCE where QUANTITY in (2,4,6);