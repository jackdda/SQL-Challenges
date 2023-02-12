/*
Show the provinces that has more patients identified as 'M' than 'F'. Must only show full province_name
*/
SELECT pr.province_name
FROM provinces pr 
JOIN patients pa 
	on pr.province_id = pa.province_id
GROUP BY pr.province_name
HAVING SUM(pa.gender LIKE 'M') > SUM(pa.gender LIKE 'F')