/* We need a breakdown for the total amount of admissions 
each doctor has started each year. Show the doctor_id, 
doctor_full_name, specialty, year, total_admissions for that year.*/

WITH CountedAdmissions AS (
  	SELECT attending_doctor_id
		, Year(admission_date) AS selected_year
		, COUNT(patient_id) AS total_admissions
	FROM admissions
	GROUP BY attending_doctor_id, Year(admission_date)
  )
  
SELECT d.doctor_id
	, Concat(d.first_name," ",d.last_name) AS doctor_full_name
    , specialty, selected_year, total_admissions
From doctors d
JOIN CountedAdmissions a
	ON d.doctor_id = a.attending_doctor_id
order by doctor_id, selected_year