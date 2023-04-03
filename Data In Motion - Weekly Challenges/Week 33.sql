/* Data In Motion SQL Challenge Week #33
Challenge #1:

The confirmation rate of a user is the number of 'confirmed' messages divided by the total number of requested confirmation messages. The confirmation rate of a user that did not request any confirmation messages is 0. Round the confirmation rate to two decimal places.

Write an SQL query to find the confirmation rate of each user.
*/
SELECT s.user_id
    , ROUND(AVG(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END), 2) 
    	AS confirmation_rate
FROM Confirmations c
RIGHT JOIN Signups s
    ON c.user_id = s.user_id
GROUP BY user_id

/* Challenge #2:
Write an SQL query that reports the product_name, year, and price for each sale_id in the Sales table.
*/
SELECT p.product_name, s.year, s.price
FROM Sales s
JOIN Product p
    ON s.product_id = p.product_id