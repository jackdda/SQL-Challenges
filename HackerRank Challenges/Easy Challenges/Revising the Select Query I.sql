/*
Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.
*/
SELECT *
FROM City c
WHERE c.POPULATION > 100000 AND COUNTRYCODE = 'USA';