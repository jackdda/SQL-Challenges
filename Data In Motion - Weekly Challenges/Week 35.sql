/* Data in Motion Weekly SQL Challenge #35

Challenge #1:
Write an SQL query to display the records with three or more rows with consecutive id's, and the number of people is greater than or equal to 100 for each. */

SELECT id, visit_date, people
FROM (
  SELECT *, COUNT(*) OVER(PARTITION BY Number_Group) AS Group_Count
  FROM (
      SELECT *, id - ROW_NUMBER() OVER(ORDER BY visit_date) AS Number_Group
      FROM Stadium
      WHERE people >= 100
    ) as difference_count
) as group_count
WHERE Group_Count >= 3

/* Challenge #2:
Write an SQL query to find the ids of products that are both low fat and recyclable. */

SELECT product_id
FROM Products
WHERE low_fats = 'Y' 
    AND recyclable = 'Y'