/*
Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/
SELECT ci.name
FROM City ci
JOIN Country co
    ON ci.countrycode = co.code
WHERE co.continent = 'AFRICA'