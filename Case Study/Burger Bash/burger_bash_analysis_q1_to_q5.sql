--  1. How many burgers were ordered? 
SELECT COUNT(*) AS total_burgers_oredered
FROM customer_orders;

--  2. How many unique customer orders were made? 
SELECT COUNT(DISTINCT order_id) AS unique_customer_orders
FROM customer_orders;

--  3. How many successful orders were delivered by each runner? 
SELECT runner_id,COUNT(*) AS successful_orders
FROM runner_orders
WHERE cancellation IS NULL
GROUP BY runner_id;

--  4. How many of each type of burger was delivered? 
SELECT bn.burger_name,COUNT(*) AS total_delivered
FROM customer_orders co
JOIN runner_orders ro ON co.order_id = ro.order_id
JOIN burger_names bn ON co.burger_id = bn.burger_id
WHERE ro.cancellation IS NULL
GROUP BY bn.burger_name;

--  5. How many Vegetarian and Meatlovers were ordered by each customer?
SELECT co.customer_id,bn.burger_name,COUNT(*) AS total_ordered
FROM customer_orders co
JOIN burger_names bn ON co.burger_id = bn.burger_id
GROUP BY co.customer_id, bn.burger_name
ORDER BY co.customer_id, bn.burger_name;