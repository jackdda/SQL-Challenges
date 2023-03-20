/*
New TikTok users sign up with their emails. They confirmed their signup by replying to the text confirmation to activate their accounts. Users may receive multiple text messages for account confirmation until they have confirmed their new account.

Write a query to find the activation rate of the users. Round the percentage to 2 decimal places.

Definitions:
emails table contain the information of user signup details.
texts table contains the users' activation information.
*/

SELECT ROUND(
  1.0 * COUNT(*) / 
  (SELECT COUNT(email_id) FROM emails)
  , 2) AS confirm_rate
FROM texts
WHERE signup_action = 'Confirmed'