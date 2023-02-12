/*
Show the first_name, last_name, and height of the patient with the greatest height.
*/
SELECT first_name, last_name, height
From patients
order by height desc
LIMIT 1