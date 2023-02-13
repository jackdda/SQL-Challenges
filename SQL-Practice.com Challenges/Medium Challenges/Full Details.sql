/*
For every admission, display the patient's full name, their admission diagnosis, and their doctor's full name who diagnosed their problem.
*/
SELECT CONCAT(pa.first_name, ' ', pa.last_name) as patient_name, a.diagnosis
	, CONCAT(ph.first_name, ' ', ph.last_name) as physician_name
FROM patients pa
JOIN admissions a 
	on pa.patient_id = a.patient_id
JOIN physicians ph 
	on a.attending_physician_id = ph.physician_id