/* Your team at JPMorgan Chase is soon launching a new credit card. 
You are asked to estimate how many cards you'll issue in the first month.

Before you can answer this question, you want to first get some perspective 
on how well new credit card launches typically do in their first month.

Write a query that outputs the name of the credit card, and how many cards 
were issued in its launch month. The launch month is the earliest record in 
the monthly_cards_issued table for a given card. Order the results starting 
from the biggest issued amount.*/

WITH months_in_operation AS (
SELECT card_name
  , issued_amount
  , ROW_NUMBER() OVER(PARTITION BY card_name ORDER BY issue_year, issue_month) AS Months
FROM monthly_cards_issued
)

SELECT card_name, issued_amount
FROM months_in_operation
WHERE months = 1
ORDER BY issued_amount DESC