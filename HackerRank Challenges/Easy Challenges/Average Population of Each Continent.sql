/*
Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/
SELECT co.continent, avg(ci.population)
FROM City ci
JOIN Country co
    ON ci.countrycode = co.code
GROUP BY co.continent