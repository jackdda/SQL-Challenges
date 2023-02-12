/*
For each day display the total amount of admissions on that day. Display the amount changed from the previous date.
*/
SELECT admission_date, count(*), COUNT(*) - LAG(COUNT(*)) OVER(ORDER by admission_date)
FROM admissions
GROUP BY admission_date