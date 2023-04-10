/* Data In Motion SQL Challenge Week #34
Challenge #1:

Write an SQL query to calculate the bonus of each employee. The bonus of an employee is 100% of their salary if the ID of the employee is an odd number and the employee name does not start with the character 'M'. The bonus of an employee is 0 otherwise.

Return the result table ordered by employee_id.
*/
SELECT employee_id
	, IF(name NOT LIKE "M%" AND employee_id % 2 <> 0, salary, 0) AS bonus
FROM employees
ORDER BY employee_id s.user_id
GROUP BY user_id

/* Challenge #2:
Write an SQL query to report the IDs of the employees whose salary is strictly less than $30000 and whose manager left the company. When a manager leaves the company, their information is deleted from the Employees table, but the reports still have their manager_id set to the manager that left.

Return the result table ordered by employee_id.
*/
SELECT employee_id
FROM employees
WHERE salary < 30000
    AND manager_ID NOT IN (
      SELECT employee_id 
      FROM employees
      )
ORDER BY Employee_ID