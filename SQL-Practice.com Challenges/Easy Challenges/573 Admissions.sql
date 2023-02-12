/*
Show the patient id and the total number of admissions for patient_id 579.
*/
SELECT patient_id, COUNT(*)
FROM admissions
where patient_id = 573