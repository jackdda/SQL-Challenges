/*
Show all of the patients grouped into weight groups.
Show the total amount of patients in each weight group.
Order the list by the weight group decending.

For example, if they weight 100 to 109 they are placed in the 100 weight group, 110-119 = 110 weight group, etc.
*/
SELECT Count(patient_id), Weight_Group
FROM (
  select p.patient_id, p.weight - (p.weight % 10) as Weight_Group
  FROM patients p
  )
GROUP BY Weight_Group 
ORDER BY Weight_Group DESC