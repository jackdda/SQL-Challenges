/*
Challenge #1

Products table:
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_id  | int     |
| store1      | int     |
| store2      | int     |
| store3      | int     |
+-------------+---------+
Write an SQL query to rearrange the Products table so that each row has (product_id, store, price). 
If a product is not available in a store, do not include a row with that product_id and store combination in the result table.
Each row in this table indicates the product's price in 3 different stores: store1, store2, and store3.
If the product is not available in a store, the price will be null in that store's column.
*/
SELECT product_id, store, price
FROM Products
UNPIVOT 
    (
        price
        FOR store IN (store1,store2,store3)
    ) as Unpivoted
WHERE price IS NOT NULL

/*
Challenge #2

Logins table:
+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| user_id        | int      |
| time_stamp     | datetime |
+----------------+----------+

Write an SQL query to report the latest login for all users in the year 2020. Do not include the users who did not login in 2020.
*/
SELECT user_id, max(time_stamp) AS last_stamp FROM Logins
WHERE YEAR (Time_stamp) = '2020'
GROUP BY user_id