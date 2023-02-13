/*
Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.
*/
SELECT p.patient_id, p.first_name
  FROM patients p 
  WHERE p.first_name LIKE 'S%s'
  	AND len(p.first_name) > 5