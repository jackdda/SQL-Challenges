/*
Display the total amount of patients for each province. Order by descending.
*/
SELECT pr.province_name, Count(patient_id) AS patient_count
FROM patients pa 
JOIN provinces pr 
	ON pa.province_id = pr.province_id
GROUP BY pr.province_name
order by patient_count desc