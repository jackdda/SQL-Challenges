/* At Kelly's Ice Cream Shop, Kelly gives a 33% discount on each customer's 3rd purchase.

Write a query to select the 3rd transaction for each customer that received that discount. 
Output the customer id, transaction id, amount, and the amount after the discount as 
"discounted_amount".

Order output on customer ID in ascending order.

Note: Transaction IDs occur sequentially. The lowest transaction ID is the earliest ID. */

WITH num_trans AS (
  SELECT *
    , ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY transaction_id) AS 'trans_num'
  FROM purchases
)

SELECT customer_id
  , transaction_id
  , amount
  , (amount * 0.67) AS 'discounted_amount'
FROM num_trans
WHERE trans_num = 3