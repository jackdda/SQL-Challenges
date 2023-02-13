/*
Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.
*/
SELECT p.province_id, sum(height)
FROM patients p
GROUP BY p.province_id
HAVING SUM(height) >= 7000
ORDER BY p.first_name DESC