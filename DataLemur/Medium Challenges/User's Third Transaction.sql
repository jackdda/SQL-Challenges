/* 
Assume you are given the table below on Uber transactions made by users. Write a query to obtain the third transaction of every user. Output the user id, spend and transaction date.

transactions Table:
Column Name			Type
user_id				integer
spend				decimal
transaction_date	timestamp
*/

WITH visits_numbered AS (
  SELECT user_id, spend, transaction_date
  , ROW_NUMBER() OVER(Partition BY user_id ORDER BY transaction_date) as visit_number
  FROM transactions
  )
SELECT user_id, spend, transaction_date
FROM visits_numbered
WHERE visit_number = 3