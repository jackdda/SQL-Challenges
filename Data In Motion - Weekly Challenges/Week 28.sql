/* 
Challenge #1
Assume you are given the tables below containing information on Snapchat users, their ages, and their time spent sending and opening snaps. Write a query to obtain a breakdown of the time spent sending vs. opening snaps (as a percentage of total time spent on these activities) for each age group.

Output the age bucket and percentage of sending and opening snaps. Round the percentage to 2 decimal places.

activities Table:
Column Name	Type
activity_id	integer
user_id	integer
activity_type	string ('send', 'open', 'chat')
time_spent	float
activity_date	datetime

age_breakdown Table:
Column Name	Type
user_id	integer
age_bucket	string ('21-25', '26-30', '31-25')

Solution #1:
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
  , ROUND(send_time/total_time * 100.0, 2) AS send_perc
  , ROUND(open_time/total_time * 100.0, 2) AS open_perc
FROM summed_times

/* 
Challenge #2
Assume you are given the tables below about Facebook pages and page likes. Write a query to return the page IDs of all the Facebook pages that don't have any likes. The output should be in ascending order.

pages Table:
Column Name	Type
page_id	integer
page_name	varchar

page_likes Table:
Column Name	Type
user_id	integer
page_id	integer
liked_date	datetime

Solution #2:
*/

SELECT page_id
FROM pages
WHERE page_id NOT IN (
  SELECT page_id
  FROM page_likes)