/*
Display every patient's first_name.
Order the list by the length of each name and then by alphbetically
*/
SELECT p.first_name
FROM patients p 
ORDER BY len(p.first_name), p.first_name