/*
Show the city and the total number of patients in the city.
Order from most to least patients and then by city name ascending.
*/
SELECT p.city, count(p.patient_id)
FROM patients p 
group by p.city
ORDER BY count(p.patient_id) DESC