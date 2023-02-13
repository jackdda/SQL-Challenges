/* 
Assume you are given the table below containing information on user transactions for particular products. Write a query to obtain the year-on-year growth rate for the total spend of each product for each year.

Output the year (in ascending order) partitioned by product id, current year's spend, previous year's spend and year-on-year growth rate (percentage rounded to 2 decimal places).

user_transactions Table:
Column Name			Type
transaction_id		integer
product_id			integer
spend				decimal
transaction_date	datetime
*/

SELECT year
    , product_id
    , curr_year_spend
    , prev_year_spend
    , ROUND((curr_year_spend-prev_year_spend)/prev_year_spend * 100, 2) as yoy_rate
FROM (
  SELECT EXTRACT(Year from transaction_date) as year
    , product_id
    , spend as curr_year_spend
    , LAG(spend) OVER(PARTITION BY product_id ORDER BY EXTRACT(Year from transaction_date)) as prev_year_spend
  FROM user_transactions
  ) as lag