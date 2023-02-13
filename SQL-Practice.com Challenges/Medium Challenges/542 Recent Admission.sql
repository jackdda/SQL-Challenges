/*
Show all columns for patient_id 542's most recent admission_date.
*/
select patient_id, nursing_unit_id, room, bed
FROM admissions
WHERE patient_id = 542
	AND admission_date = (
      SELECT max(admission_date)
      FROM admissions
      WHERE patient_id = 542)