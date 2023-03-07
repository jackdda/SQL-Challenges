/* The table below contains information about tweets over a given period of time. Calculate the 3-day rolling average of tweets published by each user for each date that a tweet was posted.
Output the user id, tweet date, and rolling averages rounded to 2 decimal places.
Important Assumptions:
Rows in this table are consecutive and ordered by date.
Each row represents a different day
A day that does not correspond to a row in this table is not counted.
The most recent day is the next row above the current row.
tweets Table:
Column Name Type
tweet_id integer
user_id
integer
tweet_date timestamp */

SELECT user_id
    , tweet_date 
    , ROUND (AVG(COUNT(tweet_id)) OVER(
        PARTITION BY user_id
        ORDER BY user_id, tweet_date
        ROWS BETWEEN 2 Preceding AND CURRENT ROW), 2
        ) AS rolling_avg_3days
FROM tweets
GROUP BY user_id, tweet_date
ORDER BY user_id, tweet_date

/* You are given the tables below containing information on Robinhood trades and
users.
Write a query to list the top three cities that have the most completed trade orders in descending order.
Output the city and number of orders.

trades Table:                                               users Table:
Column Name     Type                                        Column Name Type
order_id        integer                                     user_id     integer
user_id         integer                                     city        string
price           decimal                                     email       string
quantity        integer                                     signup_date datetime
status          string('Completed', 'Cancelled')
timestamp       datetime
*/

SELECT city, COUNT(*) AS total_orders
FROM trades t
JOIN users u
    ON t.user_id = u.user_id
WHERE status = 'Completed'
GROUP BY city
ORDER BY total_orders DESC 
LIMIT 3