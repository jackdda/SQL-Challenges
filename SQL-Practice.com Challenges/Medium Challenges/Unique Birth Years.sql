/*
Show unique birth years from patients and order them by ascending.
*/
SELECT DISTINCT YEAR(p.birth_date) as BirthYear
FROM patients p 
ORDER BY Year(p.birth_date)