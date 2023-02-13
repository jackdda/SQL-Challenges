/*
Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.
*/
select a1.patient_id, a1.primary_diagnosis
  FROM admissions a1
  GROUP by a1.patient_id, a1.primary_diagnosis
  HAVING COUNT(admission_date) > 1