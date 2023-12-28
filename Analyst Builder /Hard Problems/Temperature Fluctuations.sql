/* Write a query to find all dates with higher temperatures compared to the previous dates (yesterday).

Order dates in ascending order. */

WITH lag_day AS (
  SELECT *
    , LAG(temperature) OVER(ORDER BY date) AS 'prev_temp'
  FROM temperatures
)

SELECT date 
FROM lag_day
WHERE temperature > prev_temp;

SELECT d1.date
FROM temperatures d1
JOIN temperatures d2 
	ON DATEDIFF(d1.date, d2.date) = 1 AND d1.temperature > d2.temperature
ORDER BY d1.date;