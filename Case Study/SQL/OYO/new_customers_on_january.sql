WITH jan_customers AS (
    SELECT DISTINCT customer_id
    FROM bookings
    WHERE MONTH(date_of_booking) = 1
),
prior_customers AS (
    SELECT DISTINCT customer_id
    FROM bookings
    WHERE date_of_booking < '2022-01-01'
)
SELECT 
    COUNT(j.customer_id) AS new_customers_jan,
    (SELECT COUNT(DISTINCT customer_id) FROM bookings WHERE MONTH(date_of_booking) = 1) AS total_customers_jan,
    ROUND(COUNT(j.customer_id) * 100.0 / 
        (SELECT COUNT(DISTINCT customer_id) FROM bookings WHERE MONTH(date_of_booking) = 1), 2) AS percentage_new
FROM 
    jan_customers j
LEFT JOIN 
    prior_customers p ON j.customer_id = p.customer_id
WHERE 
    p.customer_id IS NULL;