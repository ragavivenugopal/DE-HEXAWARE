SELECT 
    h.city,
    COUNT(CASE WHEN MONTH(b.date_of_booking) = 1 THEN b.booking_id END) AS jan_bookings,
    COUNT(CASE WHEN MONTH(b.date_of_booking) = 2 THEN b.booking_id END) AS feb_bookings,
    COUNT(CASE WHEN MONTH(b.date_of_booking) = 3 THEN b.booking_id END) AS mar_bookings,
    COUNT(b.booking_id) AS total_bookings
FROM 
    bookings b
JOIN 
    hotels h ON b.hotel_id = h.hotel_id
GROUP BY 
    h.city
ORDER BY 
    total_bookings DESC;
