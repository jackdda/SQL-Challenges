/*
Show all allergies ordered by popularity. Remove NULL values from query.
*/
SELECT p.allergies, count(p.allergies)
FROM patients p 
WHERE p.allergies NOT LIKE 'NKA'
	and p.allergies is not NULL
GROUP BY p.allergies
ORDER BY count(p.allergies) DESC