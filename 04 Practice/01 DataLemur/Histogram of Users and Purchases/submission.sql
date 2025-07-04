WITH CTE AS (
  SELECT 
    user_id,
    product_id,
    transaction_date,
    MAX(transaction_date::DATE) OVER (PARTITION BY user_id) AS max_transaction_date
  FROM user_transactions
  GROUP BY user_id, product_id, transaction_date
)

SELECT
  DISTINCT transaction_date,
  user_id,
  COUNT(product_id) AS purchase_count
FROM CTE
WHERE DATE(transaction_date) = DATE(max_transaction_date)
GROUP BY user_id, transaction_date
ORDER BY transaction_date;
