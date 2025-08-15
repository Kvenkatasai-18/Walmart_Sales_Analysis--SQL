-------------- DATA ANALYSIS ---------------


1)View the first 10 rows -----
 
SELECT *
FROM walmart
LIMIT 10;

2)Total sales for the whole dataset-------

SELECT SUM(Total) AS total_sales
FROM walmart;

3) Total quantity sold per product--------

SELECT Product, SUM(Quantity) AS total_quantity
FROM walmart
GROUP BY Product
ORDER BY total_quantity DESC;

4) Average rating per branch-------

SELECT Branch, ROUND(AVG(Rating), 2) AS avg_rating
FROM walmart
GROUP BY Branch;

5) Sales per city-------
SELECT City, SUM(Total) AS city_sales
FROM walmart
GROUP BY City
ORDER BY city_sales DESC;

6) Most popular payment method-------
SELECT Payment, COUNT(*) AS usage_count
FROM walmart
GROUP BY Payment
ORDER BY usage_count DESC;


7) Highest gross income by product line----

SELECT Product, SUM(gross_income) AS total_income
FROM walmart
GROUP BY Product
ORDER BY total_income DESC;


8)Daily Sales trend---------

SELECT Date, SUM(Total) AS daily_sales
FROM walmart
GROUP BY Date
ORDER BY Date;


9)Average unit price by product line------

SELECT Product, ROUND(AVG(Unit_price), 2) AS avg_price
FROM walmart
GROUP BY Product;


10) Number of transactions per customer type------

SELECT Customer_type, COUNT(*) AS num_transactions
FROM walmart
GROUP BY  Customer_type;

11) Sales split by gender---------

SELECT Gender, SUM(Total) AS total_sales
FROM walmart
GROUP BY Gender;

12) Branch with highest total sales

SELECT Branch, SUM(Total) AS total_sales
FROM walmart
GROUP BY Branch
ORDER BY total_sales DESC
LIMIT 1;

13) Average gross margin percentage per branch---------

SELECT Branch, ROUND(AVG(gross_margin_percentage), 2) AS avg_margin
FROM walmart
GROUP BY Branch;

14) Top 5 dates with highest sales

SELECT Date, SUM(Total) AS total_sales
FROM walmart
GROUP BY Date
ORDER BY total_sales DESC
LIMIT 5;

15. Average quantity sold per transaction

SELECT Product,ROUND(AVG(Quantity), 2) AS avg_quantity
FROM walmart
group by Product;

16. Product line performance by branch

SELECT Branch, Product line, SUM(Total) AS sales
FROM walmart
GROUP BY Branch, Product
ORDER BY Branch, sales DESC;

17. Most purchased product line by male customers

SELECT Product, SUM(Quantity) AS total_qty
FROM walmart
WHERE Gender = 'Male'
GROUP BY Product
ORDER BY total_qty DESC;


18. Transactions with unit price above average

SELECT *
FROM walmart
WHERE Unit_price > (SELECT AVG(Unit_price) FROM walmart);


19) Branch with the highest average customer rating

SELECT Branch, ROUND(AVG(Rating), 2) AS avg_rating
FROM walmart
GROUP BY Branch
ORDER BY avg_rating DESC
LIMIT 3;


20)Top 3 product lines by total sales in each branch

WITH sales_by_product AS (
    SELECT Branch,
           Product,
           SUM(Total) AS total_sales,
           RANK() OVER (PARTITION BY Branch ORDER BY SUM(Total) DESC) AS rnk
    FROM walmart
    GROUP BY Branch, Product)
SELECT *
FROM sales_by_product
WHERE rnk <= 3
ORDER BY Branch, rnk;


21)Find best-selling product line for each city

WITH product_city_sales AS (
    SELECT City,
           Product line,
           SUM(Quantity) AS total_qty,
           RANK() OVER (PARTITION BY City ORDER BY SUM(Quantity) DESC) AS rnk
    FROM walmart
    GROUP BY City, Product)
    
SELECT *
FROM product_city_sales
WHERE rnk = 1;





