## Final Account Balance

Given a table containing information about bank deposits and withdrawals made using Paypal, write a query to retrieve the final account balance for each account, taking into account all the transactions recorded in the table with the assumption that there are no missing transactions.

### **`transactions` Table:**

| **Column Name** | **Type** |
| --- | --- |
| transaction_id | integer |
| account_id | integer |
| amount | decimal |
| transaction_type | varchar |

### **`transactions` Example Input:**

| **transaction_id** | **account_id** | **amount** | **transaction_type** |
| --- | --- | --- | --- |
| 123 | 101 | 10.00 | Deposit |
| 124 | 101 | 20.00 | Deposit |
| 125 | 101 | 5.00 | Withdrawal |
| 126 | 201 | 20.00 | Deposit |
| 128 | 201 | 10.00 | Withdrawal |

### **Example Output:**

| **account_id** | **final_balance** |
| --- | --- |
| 101 | 25.00 |
| 201 | 10.00 |

Using account ID 101 as an example, $30.00 was deposited into this account, while $5.00 was withdrawn. Therefore, the final account balance can be calculated as the difference between the total deposits and withdrawals which is $30.00 - $5.00, resulting in a final balance of $25.00.

The dataset you are querying against may have different input & output - this is just an example!

### **Submission:**

```sql
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
```

### **Another Solution:**

```sql
SELECT 
    account_id,
    SUM(
        CASE 
            WHEN transaction_type = 'Deposit' THEN amount 
            WHEN transaction_type = 'Withdrawal' THEN -amount 
            ELSE 0 
        END
    ) AS final_balance
FROM transactions
GROUP BY account_id
ORDER BY account_id;
```
