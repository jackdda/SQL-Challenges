/*
Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'
*/
SELECT MAX(p.weight) - MIN(p.weight)
FROM patients p
WHERE p.last_name like 'Maroni'