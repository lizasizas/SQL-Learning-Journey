# Sending vs. Opening Snaps [Snapchat SQL Interview Question]

Assume you're given tables with information on Snapchat users, including their ages and time spent sending and opening snaps.

Write a query to obtain a breakdown of the time spent sending vs. opening snaps as a percentage of total time spent on these activities grouped by age group. Round the percentage to 2 decimal places in the output.

Notes:

- Calculate the following percentages:
    - time spent sending / (Time spent sending + Time spent opening)
    - Time spent opening / (Time spent sending + Time spent opening)
- To avoid integer division in percentages, multiply by 100.0 and not 100.

*Effective April 15th, 2023, the solution has been updated and optimised.*

### **`activities` Table**

| Column Name | Type |
| --- | --- |
| activity_id | integer |
| user_id | integer |
| activity_type | string ('send', 'open', 'chat') |
| time_spent | float |
| activity_date | datetime |

### **`activities` Example Input**

| activity_id | user_id | activity_type | time_spent | activity_date |
| --- | --- | --- | --- | --- |
| 7274 | 123 | open | 4.50 | 06/22/2022 12:00:00 |
| 2425 | 123 | send | 3.50 | 06/22/2022 12:00:00 |
| 1413 | 456 | send | 5.67 | 06/23/2022 12:00:00 |
| 1414 | 789 | chat | 11.00 | 06/25/2022 12:00:00 |
| 2536 | 456 | open | 3.00 | 06/25/2022 12:00:00 |

### **`age_breakdown` Table**

| Column Name | Type |
| --- | --- |
| user_id | integer |
| age_bucket | string ('21-25', '26-30', '31-25') |

### **`age_breakdown` Example Input**

| user_id | age_bucket |
| --- | --- |
| 123 | 31-35 |
| 456 | 26-30 |
| 789 | 21-25 |

### **Example Output**

| age_bucket | send_perc | open_perc |
| --- | --- | --- |
| 26-30 | 65.40 | 34.60 |
| 31-35 | 43.75 | 56.25 |

### **Explanation**

Using the age bucket 26-30 as example, the time spent sending snaps was 5.67 and the time spent opening snaps was 3.

To calculate the percentage of time spent sending snaps, we divide the time spent sending snaps by the total time spent on sending and opening snaps, which is 5.67 + 3 = 8.67.

So, the percentage of time spent sending snaps is 5.67 / (5.67 + 3) = 65.4%, and the percentage of time spent opening snaps is 3 / (5.67 + 3) = 34.6%.

### **Submissions:**

```sql
SELECT
  age.age_bucket,
  ROUND(100.0 * SUM(CASE WHEN a.activity_type = 'send' THEN a.time_spent ELSE 0 END) 
    / SUM(CASE WHEN a.activity_type IN ('send', 'open') THEN a.time_spent ELSE 0 END), 2) AS send_perc,
  ROUND(100.0 * SUM(CASE WHEN a.activity_type = 'open' THEN a.time_spent ELSE 0 END) 
    / SUM(CASE WHEN a.activity_type IN ('send', 'open') THEN a.time_spent ELSE 0 END), 2) AS open_perc
FROM activities AS a
INNER JOIN age_breakdown AS age
  ON a.user_id = age.user_id
GROUP BY age.age_bucket; 
```

### **Output:**

![Result](https://github.com/lizasizas/SQL-Learning-Journey/blob/main/04%20Practice/01%20DataLemur/Sending%20vs.%20Opening%20Snaps/Screenshot%202024-08-06%20144901.png
)

### **Another Solution:**

```sql
-- using CTE
WITH snaps_statistics AS (
  SELECT 
    age.age_bucket, 
    SUM(CASE WHEN activities.activity_type = 'send' 
      THEN activities.time_spent ELSE 0 END) AS send_timespent, 
    SUM(CASE WHEN activities.activity_type = 'open' 
      THEN activities.time_spent ELSE 0 END) AS open_timespent, 
    SUM(activities.time_spent) AS total_timespent 
  FROM activities
  INNER JOIN age_breakdown AS age 
    ON activities.user_id = age.user_id 
  WHERE activities.activity_type IN ('send', 'open') 
  GROUP BY age.age_bucket
) 

SELECT 
  age_bucket, 
  ROUND(100.0 * send_timespent / total_timespent, 2) AS send_perc, 
  ROUND(100.0 * open_timespent / total_timespent, 2) AS open_perc 
FROM snaps_statistics;
```
