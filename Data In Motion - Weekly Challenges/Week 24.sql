/* Data In Motion SQL Challenge Week #24

Challenge #1:
Write an SQL query to report the movies with an odd-numbered ID and a description that is not "boring".
Return the result table ordered by rating in descending order.
*/
SELECT *
FROM Cinema
WHERE id % 2 <> 0
    AND description NOT LIKE 'boring'
ORDER BY rating DESC

/* Challenge #2:
Write an SQL query to report the names of all the salespersons who did not have any orders related to the company with the name "RED".
*/
SELECT s.name
FROM SalesPerson s
WHERE s.sales_id NOT IN (
    SELECT sales_id
    FROM Orders o
    JOIN Company c