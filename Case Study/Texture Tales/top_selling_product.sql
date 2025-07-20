/* Top selling product for each segment*/

WITH SegmentSales AS (
SELECT 
        pd.segment_name,
        pd.product_name,
        s.prod_id,
        SUM(s.qty) AS total_quantity,
        ROW_NUMBER() OVER (
            PARTITION BY pd.segment_name 
            ORDER BY SUM(s.qty) DESC
        ) AS rn
    FROM sales s JOIN product_details pd ON s.prod_id = pd.product_id
    GROUP BY pd.segment_name, pd.product_name, s.prod_id
)
SELECT segment_name, product_name, prod_id, total_quantity
FROM SegmentSales
WHERE rn = 1;