/*
Show first name, last name, and the full province name of each patient.

Example: 'Ontario' instead of 'ON'
*/
SELECT first_name, last_name, province_name
From patients pa 
JOIN provinces pr 
	on pa.province_id = pr.province_id