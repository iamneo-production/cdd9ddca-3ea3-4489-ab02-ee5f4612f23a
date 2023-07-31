set timing on;

-- 1.how many products were sold in feb 2019--
select count(PRODUCTNAME) as sold_products from ECOMMERCE where PURCHASE_DATE like '2019-02-%';

-- 2.total sales amount in each year--
select sum(PRICE*QUANTITY) as total_salesamount from ECOMMERCE group by substr(PURCHASE_DATE,1,4);
select sum(PRICE*QUANTITY) as total_salesamount, substr(PURCHASE_DATE,1,4) Yearly from ECOMMERCE group by substr(PURCHASE_DATE,1,4);

-- 3.total sales amount of each product on month basis in year 2019--
select PRODUCTNAME, sum(PRICE*QUANTITY) as total_salesamount, substr(PURCHASE_DATE,6,2) monthwise from ECOMMERCE where PURCHASE_DATE like '2019-%' group by PRODUCTNAME, substr(PURCHASE_DATE,6,2); 
select sum(PRICE*QUANTITY) as total_salesamount from ECOMMERCE where PURCHASE_DATE like '2019-%' group by PRODUCTNAME, substr(PURCHASE_DATE,6,2);

-- 4.count the customers from each country--
select count(CUSTOMERNO) as total_customers, COUNTRY from ECOMMERCE group by COUNTRY;
select count(CUSTOMERNO) as total_customers from ECOMMERCE group by COUNTRY;

-- 5.unique product names sold each year--
select distinct(PRODUCTNAME), substr(PURCHASE_DATE,1,4) as yearly_basis from ECOMMERCE group by substr(PURCHASE_DATE,1,4), PRODUCTNAME;


--Additional queries--

--1.Find all transactions made on a particular date--
SELECT productname FROM ecommerce WHERE purchase_date = '2019-02-02';

--2.Get the total number of transactions--
SELECT COUNT(*) AS TotalTransactions FROM ecommerce;

--3.transactions with a price greater than a specific value--
SELECT price FROM ecommerce WHERE Price>=1.94;

--4.the total revenue generated from all transactions--
SELECT SUM(Price * Quantity) AS TotalRevenue FROM ecommerce;

--5.the transactions with a quantity greater than a specific value--
SELECT productname FROM ecommerce WHERE Quantity >12;


--7.Get the average price of all transactions--
SELECT AVG(Price) AS AveragePrice FROM ecommerce;

--8.Find the transactions with a specific transaction number and customer number--
SELECT productname FROM ecommerce WHERE Transactionno = '536384'
  AND Customerno = 16029;

--9.display productname in desc order--
select productname from ecommerce order by productname desc;

--10.display productname in alphabetical order--
select productname from ecommerce order by productname;

--11. max productname--
select max(PRODUCTNAME) from ECOMMERCE;

select PRODUCTNAME, Country from ECOMMERCE;