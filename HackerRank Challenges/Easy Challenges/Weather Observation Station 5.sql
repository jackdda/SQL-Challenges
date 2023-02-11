/*
Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). 
If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
*/
SELECT TOP(1) city, LEN(city)
FROM STATION
GROUP BY city
ORDER BY LEN(city) DESC, city
SELECT TOP(1) city, LEN(city)
FROM STATION
GROUP BY city
ORDER BY LEN(city), city