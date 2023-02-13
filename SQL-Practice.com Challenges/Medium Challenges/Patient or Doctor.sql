/*
Show first name, last name and role of every person that is either patient or doctor.
The roles are either "Patient" or "Doctor"
*/
SELECT p.first_name, p.last_name, 'Patient' as Role
FROM patients p 
UNION all 
SELECT p1.first_name, p1.last_name, 'Physician' as Role
FROM physicians p1