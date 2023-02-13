/*
Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions.
*/
SELECT Day(admission_date), count(admission_date)
FROM admissions
GROUP BY Day(admission_date)
ORDER BY count(admission_date) DESC