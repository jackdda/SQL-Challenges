/*
Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.*/
SELECT c.name
FROM CITY c
WHERE c.POPULATION > 120000 AND c.COUNTRYCODE = 'USA'