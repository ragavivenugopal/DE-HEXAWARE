/* Average discount value per transaction */

SELECT AVG(discount_value) 
AS avg_discount_per_transaction
FROM (
    SELECT txn_id, SUM(discount * qty) AS discount_value
    FROM sales
    GROUP BY txn_id
) AS txn_discounts;