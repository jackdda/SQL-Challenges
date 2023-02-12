/*
Based on cities where our patient lives in, write a query to display the list of unique city starting with a vowel (a, e, i, o, u). Show the result order in ascending by city.
*/
Select Distinct city
FROM patients
WHERE city LIKE 'A%' 
	or city like 'E%'
 	or city like 'I%'
	or city like 'O%'
	or city like 'U%'
Order by city;

(MySQL)
SELECT DISTINCT city
FROM patients
WHERE REGEXP '^[aeiou]'