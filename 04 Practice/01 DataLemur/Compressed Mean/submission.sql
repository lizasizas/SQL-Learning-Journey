WITH CTE AS (
  SELECT
    SUM(order_occurrences) AS sum_orders,
    SUM(item_count::DECIMAL * order_occurrences) AS sum_items
  FROM items_per_order
)

SELECT 
  ROUND((sum_items/sum_orders), 1) AS mean
FROM CTE;
