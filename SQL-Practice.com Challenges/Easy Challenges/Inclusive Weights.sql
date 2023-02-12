/*
Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)
*/
SELECT first_name, last_name
From patients
where weight between 100 and 120