-- Create table customer_orders
CREATE TABLE customer_orders(
   order_id INT NOT NULL,
   customer_id INT NOT NULL,
   burger_id INT NOT NULL,
   exclusions VARCHAR(20),
   extras VARCHAR(20),
   order_time datetime2 NOT NULL
);


-- Insert values into customer_orders
INSERT INTO customer_orders VALUES
(1, 101, 1, NULL, NULL, '2021-01-01 18:05:02'),
(2, 101, 1, NULL, NULL, '2021-01-01 19:00:52'),
(3, 102, 1, NULL, NULL, '2021-01-02 23:51:23'),
(3, 102, 2, NULL, NULL, '2021-01-02 23:51:23'),
(4, 103, 1, '4', NULL, '2021-01-04 13:23:46'),
(4, 103, 1, '4', NULL, '2021-01-04 13:23:46'),
(4, 103, 2, '4', NULL, '2021-01-04 13:23:46'),
(5, 104, 1, NULL, '1', '2021-01-08 21:00:29'),
(6, 101, 2, NULL, NULL, '2021-01-08 21:03:13'),
(7, 105, 2, NULL, '1', '2021-01-08 21:20:29'),
(8, 102, 1, NULL, NULL, '2021-01-09 23:54:33'),
(9, 103, 1, '4', '1, 5', '2021-01-10 11:22:59'),
(10, 104, 1, NULL, NULL, '2021-01-11 18:34:49'),
(10, 104, 1, '2, 6', '1, 4', '2021-01-11 18:34:49');

SELECT * FROM customer_orders;