-- Create table runner_orders
CREATE TABLE runner_orders(
   order_id INT NOT NULL PRIMARY KEY,
   runner_id INT NOT NULL,
   pickup_time datetime2,
   distance VARCHAR(20),
   duration VARCHAR(20),
   cancellation VARCHAR(50)
);


-- Insert values into runner_orders
INSERT INTO runner_orders VALUES 
(1, 1, '2021-01-01 18:15:34', '20km', '32 minutes', NULL),
(2, 1, '2021-01-01 19:10:54', '20km', '27 minutes', NULL),
(3, 1, '2021-01-03 00:12:37', '13.4km', '20 mins', NULL),
(4, 2, '2021-01-04 13:53:03', '23.4', '40', NULL),
(5, 3, '2021-01-08 21:10:57', '10', '15', NULL),
(6, 3, NULL, NULL, NULL, 'Restaurant Cancellation'),
(7, 2, '2021-01-08 21:30:45', '25km', '25mins', NULL),
(8, 2, '2021-01-10 00:15:02', '23.4 km', '15 minute', NULL),
(9, 2, NULL, NULL, NULL, 'Customer Cancellation'),
(10, 1, '2021-01-11 18:50:20', '10km', '10minutes', NULL);

SELECT * FROM runner_orders;
