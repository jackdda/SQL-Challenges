Data In Motion SQL Case Study Questions

--1) Which product has the highest price? Only return a single row.

SELECT product_id, product_name, price
FROM products
WHERE price IN (
SELECT MAX(price)
FROM products)

--2) Which customer has made the most orders?

SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) = (
SELECT COUNT(order_id) AS order_count
FROM orders
GROUP BY customer_id
ORDER BY order_count DESC
LIMIT 1
)

--3) What's the total revenue per product?

SELECT
p.product_name, SUM(o.quantity * p.price) AS total_revenue
FROM products p
JOIN order_items o
=
o.product_id
ON p.product_id GROUP BY product_name
ORDER BY product_name

--4) Find the day with the highest revenue.

SELECT o.order_date, SUM(o_i.quantity * p.price) AS total_revenue FROM products p
JOIN order_items o_i
ON p.product_id
JOIN orders o
ON o_i.order_id
=
o_i.product_id
= o.order_id
GROUP BY 0.order_date
ORDER BY total_revenue DESC
LIMIT 1

--5) Find the first order (by date) for each customer.

SELECT customer_id, MIN(order_date)
FROM orders
GROUP BY customer_id
ORDER BY customer_id

--6) Find the top 3 customers who have ordered the most distinct products

SELECT c.customer_id, c.first_name, c.last_name, COUNT(DISTINCT oi.product_id) AS distinct_product_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY distinct_product_count DESC
LIMIT 3;

--7) Which product has been bought the least in terms of quantity?

WITH product_quantities AS (
    SELECT p.product_id, p.product_name, SUM(oi.quantity) AS total_quantity
    FROM products p
    LEFT JOIN order_items oi ON p.product_id = oi.product_id
    GROUP BY p.product_id, p.product_name
)
SELECT product_id, product_name, total_quantity
FROM product_quantities
WHERE total_quantity = (
    SELECT MIN(total_quantity)
    FROM product_quantities
)
ORDER BY product_id;

--8) What is the median order total?

WITH order_totals AS (
    SELECT o.order_id, SUM(p.price * oi.quantity) AS total
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY o.order_id
)
SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY total) AS median_order_total
FROM order_totals;

--9) For each order, determine if it was ‘Expensive’ (total over 300), ‘Affordable’ (total over 100), or ‘Cheap’.

SELECT o.order_id, 
       CASE
           WHEN SUM(p.price * oi.quantity) > 300 THEN 'Expensive'
           WHEN SUM(p.price * oi.quantity) > 100 THEN 'Affordable'
           ELSE 'Cheap'
       END AS order_category
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id
INNER JOIN products p ON oi.product_id = p.product_id
GROUP BY o.order_id;

--10) Find customers who have ordered the product with the highest price.

SELECT c.customer_id, c.first_name, c.last_name, c.email
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE p.price = (
    SELECT MAX(price)
    FROM products
);