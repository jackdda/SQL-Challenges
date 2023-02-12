/*
Show patient_id, first_name, last_name, and attending doctor's specialty.
Show only the patients who has a diagnosis as 'Epilepsy' and the doctor's first name is 'Lisa'

Check patients, admissions, and doctors tables for required information.
*/
SELECT p.patient_id, p.first_name, p.last_name, d.specialty
FROM patients p 
JOIN admissions a 
	ON a.patient_id = p.patient_id
JOIN physicians d 
	on d.physician_id = a.attending_physician_id
WHERE a.primary_diagnosis LIKE 'Epilepsy'
	AND d.first_name LIKE 'Lisa'