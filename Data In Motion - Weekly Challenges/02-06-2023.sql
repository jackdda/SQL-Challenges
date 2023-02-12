/*
Challenge #1

Table: Stocks
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| stock_name    | varchar |
| operation     | enum    |
| operation_day | int     |
| price         | int     |
+---------------+---------+
The operation column is an ENUM of type ('Sell', 'Buy')
Each row of this table indicates that the stock which has stock_name had an operation on the day operation_day with the price.
It is guaranteed that each 'Sell' operation for a stock has a corresponding 'Buy' operation in a previous day. 
It is also guaranteed that each 'Buy' operation for a stock has a corresponding 'Sell' operation in an upcoming day.
 

Write an SQL query to report the Capital gain/loss for each stock.

The Capital gain/loss of a stock is the total gain or loss after buying and selling the stock one or many times.
*/
MySQL / T-SQL Solution
SELECT stock_name
	, SUM(CASE WHEN operation='Buy'	
		THEN -price
		ELSE price END) AS capital_gain_loss
FROM Stocks
GROUP BY stock_name

/*
Cleaner MySQL solution
*/
SELECT stock_name
	, SUM(IF(operation='Buy', -price,price))
		AS capital_gain_loss
FROM Stocks
GROUP BY stock_name


/*
Challenge #2 

Table: Users

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| user_id        | int     |
| join_date      | date    |
| favorite_brand | varchar |
+----------------+---------+

Table: Orders

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| order_id      | int     |
| order_date    | date    |
| item_id       | int     |
| buyer_id      | int     |
| seller_id     | int     |
+---------------+---------+

Write an SQL query to find for each user, the join date and the number of orders they made as a buyer in 2019.
*/
SELECT u.user_id AS buyer_id
	, u.join_date
    , COUNT(o.order_id) as orders_in_2019
FROM Users u
LEFT JOIN Orders o
    ON u.user_id = o.buyer_id AND YEAR(o.order_date)=2019
GROUP BY u.user_id, u.join_date
ORDER BY buyer_id