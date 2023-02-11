/*
You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. 
Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). 
Packages contains two columns: ID and Salary (offered salary in $ thousands per month).

Write a query to output the names of those students whose best friends got offered a higher salary than them. 
Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer.
*/
SELECT s.name
FROM Students s
JOIN Friends f
    ON s.ID = f.ID
JOIN Students sc
    ON f.Friend_ID = sc.ID  
JOIN Packages p
    ON s.ID = p.ID
JOIN Packages pc
    ON pc.ID = sc.ID
WHERE p.Salary < pc.Salary
ORDER BY pc.Salary