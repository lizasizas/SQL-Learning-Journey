WITH CTE AS (
  SELECT 
    user_id,
    transaction_date,
    LEAD(transaction_date) OVER (PARTITION BY user_id) AS second_transaction_date,
    LEAD(transaction_date, 2) OVER (PARTITION BY user_id) AS third_transaction_date
  FROM transactions
)

SELECT DISTINCT user_id
FROM CTE
WHERE transaction_date + INTERVAL '1 days' = second_transaction_date 
  AND transaction_date + INTERVAL '2 days' = third_transaction_date
ORDER BY user_id;
