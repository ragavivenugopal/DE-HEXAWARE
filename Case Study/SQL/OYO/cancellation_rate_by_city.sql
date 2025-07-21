SELECT 
    h.city,
    COUNT(b.booking_id) AS total_bookings,
    SUM(CASE WHEN b.status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_bookings,
    ROUND(SUM(CASE WHEN b.status = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / COUNT(b.booking_id), 2) AS cancellation_rate
FROM 
    bookings b
JOIN 
    hotels h ON b.hotel_id = h.hotel_id
GROUP BY 
    h.city
ORDER BY 
    cancellation_rate DESC;