/*1.Find all transactions made on a particular date*/
SELECT * FROM ecommerce WHERE purchase_date = '2019-02-02';

/*2.Get the total number of transactions*/
SELECT COUNT(*) AS TotalTransactions FROM ecommerce;

/*3.transactions with a price greater than a specific value*/
SELECT * FROM ecommerce WHERE Price>=1.94;

/*4.the total revenue generated from all transactions*/
SELECT SUM(Price * Quantity) AS TotalRevenue FROM ecommerce;

/*5.the transactions with a quantity greater than a specific value*/
SELECT * FROM ecommerce WHERE Quantity >12;

/*6.Retrieve the latest transaction made*/
SELECT * FROM ecommerce ORDER BY purchase_date DESC
FETCH FIRST 1 ROW ONLY;

/*7.Get the average price of all transactions*/
SELECT AVG(Price) AS AveragePrice FROM ecommerce;

/*8.Find the transactions with a specific transaction number and customer number*/
SELECT * FROM ecommerce WHERE Transactionno = '536384'
  AND Customerno = 16029;

/*9.display table ecommerce*/
select * from ecommerce;

/*10.display productname in desc order*/
select productname from ecommerce order by productname desc;