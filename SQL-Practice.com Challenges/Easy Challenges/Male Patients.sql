/*
Show first name, last name, and gender of patients who's gender is 'M'

*/
SELECT p.first_name, p.last_name, p.gender
FROM patients p
WHERE p.gender LIKE 'M'