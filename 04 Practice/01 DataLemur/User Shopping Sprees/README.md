# User Shopping Sprees [Amazon SQL Interview Question]

Select: medium
Multi-select: CTE, date function, window function
Status: Done
Created: June 27, 2025 1:59 PM

In an effort to identify high-value customers, Amazon asked for your help to obtain data about users who go on shopping sprees. A shopping spree occurs when a user makes purchases on 3 or more consecutive days.

List the user IDs who have gone on at least 1 shopping spree in ascending order.

### **`transactions` Table:**

| **Column Name** | **Type** |
| --- | --- |
| user_id | integer |
| amount | float |
| transaction_date | timestamp |

### **`transactions` Example Input:**

| **user_id** | **amount** | **transaction_date** |
| --- | --- | --- |
| 1 | 9.99 | 08/01/2022 10:00:00 |
| 1 | 55 | 08/17/2022 10:00:00 |
| 2 | 149.5 | 08/05/2022 10:00:00 |
| 2 | 4.89 | 08/06/2022 10:00:00 |
| 2 | 34 | 08/07/2022 10:00:00 |

### **Example Output:**

user_id

---

2

---

### **Explanation**

In this example, **`user_id`** 2 is the only one who has gone on a shopping spree.

### **Submissions:**

```sql
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
```

### **Another Solution:**

```sql
SELECT DISTINCT T1.user_id
FROM transactions AS T1
INNER JOIN transactions AS T2
  ON DATE(T2.transaction_date) = DATE(T1.transaction_date) + 1
INNER JOIN transactions AS T3
  ON DATE(T3.transaction_date) = DATE(T1.transaction_date) + 2
ORDER BY T1.user_id;
```
