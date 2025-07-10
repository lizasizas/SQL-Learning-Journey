# Odd and Even Measurements [Google SQL Interview Question]

Select: medium
Multi-select: CTE, case, date function, row number/rank, sub query
Status: Done
Created: May 29, 2025 7:21 PM

Assume you're given a table with measurement values obtained from a Google sensor over multiple days with measurements taken multiple times within each day.

Write a query to calculate the sum of odd-numbered and even-numbered measurements separately for a particular day and display the results in two different columns. Refer to the Example Output below for the desired format.

Definition:

- Within a day, measurements taken at 1st, 3rd, and 5th times are considered odd-numbered measurements, and measurements taken at 2nd, 4th, and 6th times are considered even-numbered measurements.

*Effective April 15th, 2023, the question and solution for this question have been revised.*

### **`measurements` Table:**

| **Column Name** | **Type** |
| --- | --- |
| measurement_id | integer |
| measurement_value | decimal |
| measurement_time | datetime |

### **`measurements` Example Input:**

| **measurement_id** | **measurement_value** | **measurement_time** |
| --- | --- | --- |
| 131233 | 1109.51 | 07/10/2022 09:00:00 |
| 135211 | 1662.74 | 07/10/2022 11:00:00 |
| 523542 | 1246.24 | 07/10/2022 13:15:00 |
| 143562 | 1124.50 | 07/11/2022 15:00:00 |
| 346462 | 1234.14 | 07/11/2022 16:45:00 |

### **Example Output:**

| **measurement_day** | **odd_sum** | **even_sum** |
| --- | --- | --- |
| 07/10/2022 00:00:00 | 2355.75 | 1662.74 |
| 07/11/2022 00:00:00 | 1124.50 | 1234.14 |

### **Explanation**

Based on the results,

- On 07/10/2022, the sum of the odd-numbered measurements is 2355.75, while the sum of the even-numbered measurements is 1662.74.
- On 07/11/2022, there are only two measurements available. The sum of the odd-numbered measurements is 1124.50, and the sum of the even-numbered measurements is 1234.14.

### **Submissions:**

```sql
WITH CTE AS (
  SELECT
    *,
    ROW_NUMBER() OVER (PARTITION BY timee ORDER BY timee) AS numberr
  FROM
    (SELECT measurement_time::DATE AS timee, measurement_value 
    FROM measurements
    ORDER BY measurement_time
    ) AS new_table
)

SELECT 
  DISTINCT timee AS measurement_day,
  SUM (CASE WHEN numberr % 2 != 0 THEN measurement_value ELSE 0 END) AS odd_sum,
  SUM (CASE WHEN numberr % 2 = 0 THEN measurement_value ELSE 0 END) AS even_sum
FROM CTE
GROUP BY timee
ORDER BY timee;
```

### **Another Solution:**

```sql
WITH ranked_measurements AS (
  SELECT 
    CAST(measurement_time AS DATE) AS measurement_day, 
    measurement_value, 
    ROW_NUMBER() OVER (
      PARTITION BY CAST(measurement_time AS DATE) 
      ORDER BY measurement_time) AS measurement_num 
  FROM measurements
) 

SELECT 
  measurement_day, 
  SUM(measurement_value) FILTER (WHERE measurement_num % 2 != 0) AS odd_sum, 
  SUM(measurement_value) FILTER (WHERE measurement_num % 2 = 0) AS even_sum 
FROM ranked_measurements
GROUP BY measurement_day;
```
