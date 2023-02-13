/*
We want to display each patient's full name in a single column. Their last_name in all upper letters must appear first, then first_name in all lower case letters. Separate the last_name and first_name with a comma. Order the list by the first_name in decending order
EX: SMITH,jane
*/
SELECT concat(upper(p.last_name), ',', LOWER(p.first_name)) AS FullName
FROM patients p
ORDER BY p.first_name DESC