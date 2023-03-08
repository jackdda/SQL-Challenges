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