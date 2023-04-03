/* Data In Motion SQL Challenge Week #25

Challenge #1:
Write an SQL query to find all the authors that viewed at least one of their own articles.
*/
SELECT DISTINCT author_id as id 
FROM views 
WHERE author_id = viewer_id 
ORDER BY id

/* Challenge #1:
Write an SQL query that reports the products that were only sold in the first quarter of 2019. That is, between 2019-01-01 and 2019-03-31 inclusive.
*/
SELECT p.product_id, p.product_name
FROM Product p
JOIN Sales s
    ON p.product_id = s.product_id
GROUP BY p.product_id
HAVING MIN(sale_date) >= '2019-01-01'
    AND MAX(sale_date) <= '2019-03-31'