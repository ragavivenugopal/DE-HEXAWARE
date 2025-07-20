SELECT 
    SUM(CASE WHEN status = 'Stayed' THEN amount - discount ELSE 0 END) AS net_revenue
FROM 
    bookings;