/* 
Sales Table:
customer_id	order_date	product_id
A	2021-01-01T00:00:00.000Z	1
A	2021-01-01T00:00:00.000Z	2
A	2021-01-07T00:00:00.000Z	2
A	2021-01-10T00:00:00.000Z	3
A	2021-01-11T00:00:00.000Z	3
A	2021-01-11T00:00:00.000Z	3
B	2021-01-01T00:00:00.000Z	2
B	2021-01-02T00:00:00.000Z	2
B	2021-01-04T00:00:00.000Z	1
B	2021-01-11T00:00:00.000Z	1
B	2021-01-16T00:00:00.000Z	3
B	2021-02-01T00:00:00.000Z	3
C	2021-01-01T00:00:00.000Z	3
C	2021-01-01T00:00:00.000Z	3
C	2021-01-07T00:00:00.000Z	3

Menu Table:
product_id	product_name	price
1	sushi	10
2	curry	15
3	ramen	12

--------------------
   Case Study Questions
   --------------------
-- 1. What is the total amount each customer spent at the restaurant?
-- 2. How many days has each customer visited the restaurant?
-- 3. What was the first item from the menu purchased by each customer?


Solution #1 */

SELECT s.customer_id AS Customer, SUM(m.price) AS Total_Spent
FROM dannys_diner.menu m
JOIN dannys_diner.sales s
	ON s.product_id = m.product_id
GROUP BY s.customer_id
ORDER BY Total_Spent DESC

/* Solution #2 */

SELECT s.customer_id AS Customer, COUNT(DISTINCT Order_Date) AS Days_Visited
FROM dannys_diner.sales s
GROUP BY s.customer_id
ORDER BY Customer

/* Solution #3 */

SELECT Customer, Product_id as First_Purchase
FROM (
  SELECT s.customer_id AS Customer
  , product_id
  , ROW_NUMBER() OVER(PARTITION BY CUSTOMER_ID ORDER BY order_date) AS Visit_Number
  FROM dannys_diner.sales s
  ) as Numbered_Visits
WHERE Visit_Number = 1