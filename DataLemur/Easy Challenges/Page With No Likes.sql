/* 
Assume you are given the tables below about Facebook pages and page likes. Write a query to return the page IDs of all the Facebook pages that don't have any likes. The output should be in ascending order.

pages Table:
Column Name			Type
page_id				integer
page_name			varchar

page_likes Table:
Column Name			Type
user_id				integer
page_id				integer
liked_date			datetime

*/

SELECT page_id
FROM pages
WHERE page_id NOT IN (
  SELECT page_id
  FROM page_likes)