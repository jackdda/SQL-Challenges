/*
Assume you are given the table containing information on Amazon customers and their spending on products in various categories.

Identify the top two highest-grossing products within each category in 2022. Output the category, product, and total spend.

product_spend Table:
Column Name			Type
category			string
product				string
user_id				integer
spend				decimal
transaction_date	timestamp
*/

WITH prod_ranked AS (
  SELECT category
    , product
    , SUM(spend) as total_spend
    , RANK() OVER(
        PARTITION BY category 
        ORDER BY SUM(spend) DESC
        ) as ranked
  FROM product_spend
  WHERE EXTRACT(YEAR FROM transaction_date) = 2022
  GROUP BY category, product
  )

SELECT category, product, total_spend
FROM prod_ranked
WHERE ranked <= 2