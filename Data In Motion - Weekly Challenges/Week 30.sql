/* Solution #1:
Given the reviews table, write a query to get the average stars for each product every month.

The output should include the month in numerical value, product id, and average star rating rounded to two decimal places. Sort the output based on month followed by the product id.

reviews Table:
Column Name	Type
review_id	integer
user_id		integer
submit_date	datetime
product_id	integer
stars		integer (1-5)

review_id	user_id		submit_date				product_id		stars
6171		123			06/08/2022 00:00:00		50001			4
7802		265			06/10/2022 00:00:00		69852			4
5293		362			06/18/2022 00:00:00		50001			3
6352		192			07/26/2022 00:00:00		69852			3
4517		981			07/05/2022 00:00:00		69852			2
*/


SELECT EXTRACT(MONTH FROM submit_date) AS month
  , product_id AS product
  , ROUND(AVG(stars), 2) AS avg_stars
FROM review
GROUP BY EXTRACT(MONTH FROM submit_date)
  , product_id
ORDER BY month, product_id;

/* Solution #2
Assume you are given the table containing measurement values obtained from a Google sensor over several days. Measurements are taken several times within a given day.

Write a query to obtain the sum of the odd-numbered and even-numbered measurements on a particular day, in two different columns. Refer to the Example Output below for the output format.

Definition:
1st, 3rd, and 5th measurements taken within a day are considered odd-numbered measurements and the 2nd, 4th, and 6th measurements are even-numbered measurements.

measurements Table:
Column Name	Type
measurement_id		integer
measurement_value	decimal
measurement_time	datetime

measurement_id	measurement_value	measurement_time
131233			1109.51				07/10/2022 09:00:00
135211			1662.74				07/10/2022 11:00:00
523542			1246.24				07/10/2022 13:15:00
143562			1124.50				07/11/2022 15:00:00
346462			1234.14				07/11/2022 16:45:00
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