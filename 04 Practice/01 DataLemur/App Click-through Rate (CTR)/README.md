# App Click-through Rate (CTR) [Facebook SQL Interview Question]

Created: July 26, 2024 11:47 AM
Select: easy
Status: Done

Assume you have an events table on Facebook app analytics. Write a query to calculate the click-through rate (CTR) for the app in 2022 and round the results to 2 decimal places.

Definition and note:

- Percentage of click-through rate (CTR) = 100.0 * Number of clicks / Number of impressions
- To avoid integer division, multiply the CTR by 100.0, not 100.

### **`events` Table:**

| Column Name | Type |
| --- | --- |
| app_id | integer |
| event_type | string |
| timestamp | datetime |

### **`events` Example Input:**

| app_id | event_type | timestamp |
| --- | --- | --- |
| 123 | impression | 07/18/2022 11:36:12 |
| 123 | impression | 07/18/2022 11:37:12 |
| 123 | click | 07/18/2022 11:37:42 |
| 234 | impression | 07/18/2022 14:15:12 |
| 234 | click | 07/18/2022 14:16:12 |

### **Example Output:**

| app_id | ctr |
| --- | --- |
| 123 | 50.00 |
| 234 | 100.00 |

### **Explanation**

Let's consider an example of App 123. This app has a click-through rate (CTR) of 50.00% because out of the 2 impressions it received, it got 1 click.

To calculate the CTR, we divide the number of clicks by the number of impressions, and then multiply the result by 100.0 to express it as a percentage. In this case, 1 divided by 2 equals 0.5, and when multiplied by 100.0, it becomes 50.00%. So, the CTR of App 123 is 50.00%.

### **Submissions:**

```sql
SELECT
  app_id,
  ROUND(100.0 * 
    COUNT(CASE WHEN event_type = 'click' THEN 1 ELSE NULL END) / 
    COUNT(CASE WHEN event_type = 'impression' THEN 1 ELSE NULL END), 2) AS ctr
FROM events
WHERE DATE_PART('YEAR', timestamp) = 2022
GROUP BY app_id;
```

### **Output:**

![Result](https://github.com/lizasizas/SQL-Learning-Journey/blob/main/04%20Practice/01%20DataLemur/App%20Click-through%20Rate%20(CTR)/Screenshot%202024-08-01%20114951.png)
