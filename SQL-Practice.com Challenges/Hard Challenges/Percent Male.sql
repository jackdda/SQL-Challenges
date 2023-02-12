/*
Show the percent of patients that have 'M' as their gender. Round the answer to the nearest hundreth number and in percent form.
*/
WITH cte AS (
  SELECT distinct patient_id, gender
  FROM patients
  )
SELECT CONCAT(ROUND((
  	SELECT CAST(COUNT(patient_id) as float)
	FROM cte
	WHERE gender = 'M'
	GROUP BY gender
  	)
	/ (SELECT CAST(COUNT(patient_id) as float)
		FROM cte),4) * 100,'%') as percent_of_male_patients