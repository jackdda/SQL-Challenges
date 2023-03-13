/*
CVS Health is trying to better understand its pharmacy sales, and how well different products are selling. Each drug can only be produced by one manufacturer.

Write a query to find the top 3 most profitable drugs sold, and how much profit they made. Assume that there are no ties in the profits. Display the result from the highest to the lowest total profit.
*/

SELECT drug, total_sales - cogs AS profit
FROM pharmacy_sales
ORDER BY profit DESC
LIMIT 3;

/*
CVS Health is trying to better understand its pharmacy sales, and how well different products are selling. Each drug can only be produced by one manufacturer.

Write a query to find out which manufacturer is associated with the drugs that were not profitable and how much money CVS lost on these drugs. 

Output the manufacturer, number of drugs and total losses. Total losses should be in absolute value. Display the results with the highest losses on top.
*/
SELECT manufacturer
  , COUNT(drug) as drug_count
  , ABS(SUM(total_sales - cogs)) as total_loss
FROM pharmacy_sales
WHERE (total_sales - cogs) < 0
GROUP BY manufacturer
ORDER BY total_loss DESC;