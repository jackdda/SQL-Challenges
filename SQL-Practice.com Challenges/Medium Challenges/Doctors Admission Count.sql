/*
Show first_name, last_name, and the total number of admissions attended for each doctor.

Every admission has been attended by a doctor.
*/
SELECT p.first_name, p.last_name, count(*)
FROM admissions a 
JOIN physicians p 
	on a.attending_physician_id = p.physician_id
GROUP BY p.first_name, p.last_name