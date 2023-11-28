/*Assume you're given tables with information about TikTok user 
sign-ups and confirmations through email and text. New users on 
TikTok sign up using their email addresses, and upon sign-up, 
each user receives a text message confirmation to activate their account.

Write a query to display the user IDs of those who did not confirm 
their sign-up on the first day, but confirmed on the second day. */

SELECT user_id
FROM emails e
JOIN texts t 
  ON e.email_id = t.email_id
WHERE action_date::DATE - signup_date::DATE = 1
  AND signup_action = 'Confirmed'