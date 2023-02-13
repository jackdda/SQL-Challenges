/*
Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name.
*/
SELECT p.first_name, p.last_name, p.allergies
FROM patients p 
WHERE allergies LIKE 'Penicillin'
	OR allergies LIKE 'Morphine'
ORDER BY allergies, first_name, last_name