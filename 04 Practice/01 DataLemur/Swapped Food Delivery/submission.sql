WITH CTE AS (
  SELECT MAX(order_id) AS max_order
  FROM orders
)

SELECT 
  CASE
    WHEN order_id = max_order AND NOT order_id % 2 = 0 THEN order_id
    WHEN NOT order_id = max_order AND NOT order_id % 2 = 0 THEN order_id + 1
    ELSE order_id - 1
  END AS correct_order_id,
  item
FROM orders
CROSS JOIN CTE
ORDER BY correct_order_id;
