
/* Top 3 products by total revenue before discount */

SELECT TOP 3 
    pd.product_name,
    s.prod_id,
    SUM(s.qty * s.price) AS total_revenue
FROM sales s
JOIN product_details pd ON s.prod_id = pd.product_id
GROUP BY pd.product_name, s.prod_id
ORDER BY total_revenue DESC;