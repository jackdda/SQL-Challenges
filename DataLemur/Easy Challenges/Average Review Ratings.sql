/* 
Given the reviews table, write a query to get the average stars for each product every month.

The output should include the month in numerical value, product id, and average star rating rounded to two decimal places. 
Sort the output based on month followed by the product id.

reviews Table:
Column Name	    Type
review_id   	integer
user_id	        integer
submit_date 	datetime
product_id	    integer
stars       	integer (1-5)
*/

SELECT EXTRACT(MONTH FROM submit_date) AS month
  , product_id AS product
  ,  ROUND(AVG(stars), 2) AS avg_stars
FROM reviews
GROUP BY EXTRACT(MONTH FROM submit_date)
  , product_id
ORDER BY month, product_id;

/*
Assume you are given the table containing measurement values obtained from a Google sensor over several days. Measurements are taken several times within a given day.

Write a query to obtain the sum of the odd-numbered and even-numbered measurements on a particular day, in two different columns. Refer to the Example Output below for the output format.

Definition:
1st, 3rd, and 5th measurements taken within a day are considered odd-numbered measurements and the 2nd, 4th, and 6th measurements are even-numbered measurements.

measurements Table:
Column Name     	Type
measurement_id	    integer
measurement_value	decimal
measurement_time	datetime
*/
WITH Numbered AS (
  SELECT *
  , (ROW_NUMBER() OVER(PARTITION BY EXTRACT(DAY FROM measurement_time) ORDER BY measurement_time))%2 as even_odd
  FROM measurements
  )

SELECT Date(measurement_time) as measurement_day
  , SUM(CASE WHEN even_odd = 1 THEN measurement_value ELSE 0 END) AS odd_sum
  , SUM(CASE WHEN even_odd = 0 THEN measurement_value ELSE 0 END) AS even_sum
FROM Numbered
GROUP BY measurement_day
ORDER BY measurement_day