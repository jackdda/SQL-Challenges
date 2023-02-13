/*
Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date.
*/
select p.first_name, p.last_name, p.birth_date
FROM patients p 
WHERE YEAR(p.birth_date) LIKE '197%'
ORDER BY p.birth_date