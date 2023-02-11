/*
You are given a table, Projects, containing three columns: Task_ID, Start_Date and End_Date. It is guaranteed that the difference between the End_Date and the Start_Date is equal to 1 day for each row in the table.

If the End_Date of the tasks are consecutive, then they are part of the same project. Samantha is interested in finding the total number of different projects completed.

Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. If there is more than one project that have the same number of completion days, then order by the start date of the project.
*/
SELECT Start_Date, MIN(End_Date)
FROM 
    (SELECT Start_Date FROM Projects WHERE Start_Date NOT IN 
        (SELECT End_Date FROM Projects)) a,
    (SELECT end_date FROM PROJECTS WHERE end_date NOT IN 
        (SELECT start_date FROM PROJECTS)) b
WHERE Start_Date < End_Date
GROUP BY Start_Date
ORDER BY DATEDIFF(Day, MIN(End_Date), Start_Date) desc, Start_date