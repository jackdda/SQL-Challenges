/*
Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.*/
SELECT SUM(ci.population)
FROM City ci
JOIN Country co
    ON ci.countrycode = co.code
WHERE co.continent = 'ASIA'