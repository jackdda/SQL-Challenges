/*
Show first name of patients that start with the letter 'C'
*/
SELECT p.first_name
FROM patients p 
WHERE p.first_name LIKE 'C%'