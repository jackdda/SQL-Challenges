/* 
Assume you have the table below containing information on Facebook user actions. Write a query to obtain the active user retention in July 2022. Output the month (in numerical format 1, 2, 3) and the number of monthly active users (MAUs).

Hint: An active user is a user who has user action ("sign-in", "like", or "comment") in the current month and last month.

user_actions Table:
Column Name		Type
user_id			integer
event_id		integer
event_type		string ("sign-in, "like", "comment")
event_date		datetime
*/

SELECT EXTRACT(MONTH FROM event_date) as month, COUNT(DISTINCT user_id) as monthly_active_users
FROM user_actions
WHERE EXTRACT(MONTH FROM event_date) = 7 
  AND user_id IN (
    SELECT user_id
    FROM user_actions
    WHERE EXTRACT(MONTH FROM event_date) = 6
    )
GROUP BY EXTRACT(MONTH FROM event_date)