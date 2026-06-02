WITH deposit AS (
  SELECT 
    account_id, 
    SUM(amount) AS deposit
  FROM transactions
  WHERE transaction_type = 'Deposit'
  GROUP BY account_id
),

withdrawal AS (
  SELECT 
    account_id, 
    SUM(amount) AS withdrawal
  FROM transactions
  WHERE transaction_type = 'Withdrawal'
  GROUP BY account_id
)

SELECT 
  COALESCE(d.account_id, w.account_id) AS account_id,
  COALESCE(d.deposit, 0) - COALESCE(w.withdrawal, 0) AS final_balance
FROM deposit d
FULL OUTER JOIN withdrawal w ON d.account_id = w.account_id;
