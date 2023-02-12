/*
Show first name and last name of patients who does not have allergies. (null)
*/
SELECT p.first_name, p.last_name
FROM patients p 
WHERE p.allergies IS NULL