SELECT 
    h.city,
    AVG(b.amount) AS average_room_rate,
    COUNT(b.booking_id) AS total_bookings
FROM 
    bookings b
JOIN 
    hotels h ON b.hotel_id = h.hotel_id
WHERE 
    b.status = 'Stayed' -- Only consider completed stays
GROUP BY 
    h.city
ORDER BY 
    average_room_rate DESC;
