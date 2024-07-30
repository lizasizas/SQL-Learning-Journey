SELECT 
  city,
  COUNT(order_id) AS total_orders
FROM trades AS t
FULL JOIN users AS u 
  ON t.user_id=u.user_id
WHERE status = 'Completed'
GROUP BY city
ORDER BY total_orders DESC
LIMIT 3;
