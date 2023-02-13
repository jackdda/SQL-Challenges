/* 
Question 1:
How can you produce a list of facilities that charge a fee to members? 
*/
SELECT *
FROM cd.facilities
WHERE membercost > 0

/* 
Question 2:
How can you produce a list of facilities that charge a fee to members? 
*/
SELECT *
FROM cd.facilities
WHERE name LIKE '%Tennis%'

/* 
Question 3:
How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.
*/
SELECT *
FROM cd.facilities
WHERE facid = 1 
UNION ALL
SELECT *
FROM cd.facilities
WHERE facid = 5

/* 
Question 4:
Find all Lyft drivers who earn either equal to or less than 30k USD or equal to or more than 70k USD.
Output all details related to retrieved records.
*/
SELECT *
FROM lyft_drivers
WHERE yearly_salary <= 30,000 
    OR yearly_salary > 70,000;

/* 
Question 4:
Count the number of movies that Abigail Breslin was nominated for an oscar.
*/
SELECT count(movie)
FROM oscar_nominees;
WHERE nominee LIKE "Abigail Breslin"