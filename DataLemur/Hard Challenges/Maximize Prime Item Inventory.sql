/*
Amazon wants to maximize the number of items it can stock in a 500,000 square feet warehouse. It wants to stock as many prime items as possible, and afterwards use the remaining square footage to stock the most number of non-prime items.

Write a SQL query to find the number of prime and non-prime items that can be stored in the 500,000 square feet warehouse. Output the item type and number of items to be stocked.

inventory table:
Column Name	    Type
item_id 	    integer
item_type   	string
item_category	string
square_footage	decimal
*/

WITH not_prime as (
  SELECT item_type, COUNT(item_id) * (
    SELECT FLOOR(
      (SELECT MOD(500000, sum(square_footage))
      FROM inventory
      WHERE item_type = 'prime_eligible'
      ) / sum(square_footage))
    FROM inventory
    WHERE item_type = 'not_prime'
    ) as item_count
  FROM inventory
  WHERE item_type = 'not_prime'
  GROUP BY item_type
  )
, prime_eligible as (
  SELECT item_type, COUNT(item_id) * (
    SELECT FLOOR(500000 / sum(square_footage))
    FROM inventory
    WHERE item_type = 'prime_eligible'
    ) as item_count
  FROM inventory
  WHERE item_type = 'prime_eligible'
  GROUP BY item_type
  )
  
SELECT *
FROM prime_eligible
UNION ALL
SELECT *
FROM not_prime