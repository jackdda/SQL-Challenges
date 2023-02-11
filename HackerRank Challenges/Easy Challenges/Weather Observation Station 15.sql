/*
Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. 
Round your answer to 4 decimal places.
*/
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N  = (SELECT MAX(lat_n) 
               FROM Station 
               WHERE lat_n < 137.2345)