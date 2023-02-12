/*
Sort the province names in ascending order in such a way that the province 'Ontario' is always on top.
*/
SELECT province_name 
FROM province_names
WHERE province_name like 'Ontario'
UNION ALL
SELECT province_name 
FROM province_names
WHERE province_name not like 'Ontario'