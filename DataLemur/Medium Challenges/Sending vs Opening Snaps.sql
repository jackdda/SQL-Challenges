/* 
Assume you are given the tables below containing information on Snapchat users, their ages, and their time spent sending and opening snaps. Write a query to obtain a breakdown of the time spent sending vs. opening snaps (as a percentage of total time spent on these activities) for each age group.

Output the age bucket and percentage of sending and opening snaps. Round the percentage to 2 decimal places.

Notes:

You should calculate these percentages:
time sending / (time sending + time opening)
time opening / (time sending + time opening)
To avoid integer division in percentages, multiply by 100.0 and not 100.

activities Table:
Column Name	Type
activity_id				integer
user_id					integer
activity_type			string ('send', 'open', 'chat')
time_spent				float
activity_date			datetime

age_breakdown Table:
Column Name				Type
user_id					integer
age_bucket				string ('21-25', '26-30', '31-25')

*/

WITH summed_times AS (
  SELECT age_bucket
    , SUM(time_spent) as total_time
    , SUM(CASE WHEN activity_type = 'open' THEN time_spent ELSE 0 END) AS open_time
    , SUM(CASE WHEN activity_type = 'send' THEN time_spent ELSE 0 END) AS send_time
  FROM activities 
  JOIN age_breakdown
    on activities.user_id = age_breakdown.user_id
  WHERE activity_type = 'open' or activity_type= 'send'
  GROUP BY age_bucket
  ORDER BY age_bucket
  )
SELECT age_bucket
  , ROUND(send_time/total_time * 100, 2) AS send_perc
  , ROUND(open_time/total_time * 100, 2) AS open_perc
FROM summed_times