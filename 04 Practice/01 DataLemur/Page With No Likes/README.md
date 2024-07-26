# Page With No Likes [Facebook SQL Interview Question]

Created: July 25, 2024 2:55 PM
Select: easy
Status: Done

Assume you're given two tables containing data about Facebook Pages and their respective likes (as in "Like a Facebook Page").

Write a query to return the IDs of the Facebook pages that have zero likes. The output should be sorted in ascending order based on the page IDs.

### **`pages` Table:**

| Column Name | Type |
| --- | --- |
| page_id | integer |
| page_name | varchar |

### **`pages` Example Input:**

| page_id | page_name |
| --- | --- |
| 20001 | SQL Solutions |
| 20045 | Brain Exercises |
| 20701 | Tips for Data Analysts |

### **`page_likes` Table:**

| Column Name | Type |
| --- | --- |
| user_id | integer |
| page_id | integer |
| liked_date | datetime |

### **`page_likes` Example Input:**

| user_id | page_id | liked_date |
| --- | --- | --- |
| 111 | 20001 | 04/08/2022 00:00:00 |
| 121 | 20045 | 03/12/2022 00:00:00 |
| 156 | 20001 | 07/25/2022 00:00:00 |

### **Example Output:**

**page_id**

---

20701

---

### **Submissions:**

```sql
WITH join_data AS (
  SELECT
      p.page_id,
      COALESCE(COUNT(user_id),0) AS user_count
  FROM pages as p
  FULL JOIN page_likes AS l
  ON p.page_id = l.page_id
  GROUP BY p.page_id
)

SELECT page_id
FROM join_data
WHERE user_count = 0
ORDER BY page_id

-- another submission
SELECT p.page_id
FROM pages as p
FULL JOIN page_likes AS l 
  ON p.page_id = l.page_id
WHERE l.page_id IS NULL
GROUP BY p.page_id
```

### **Another Solution:**

```sql
-- method 1
SELECT page_id
FROM pages
EXCEPT
SELECT page_id
FROM page_likes;

-- Using LEFT OUTER JOIN
SELECT pages.page_id
FROM pages
LEFT OUTER JOIN page_likes AS likes
  ON pages.page_id = likes.page_id
WHERE likes.page_id IS NULL;

-- Using NOT IN` clause
SELECT page_id
FROM pages
WHERE page_id NOT IN (
  SELECT page_id
  FROM page_likes
  WHERE page_id IS NOT NULL
  
-- Using NOT EXISTS clause
SELECT page_id
FROM pages
WHERE NOT EXISTS (
  SELECT page_id
  FROM page_likes AS likes
  WHERE likes.page_id = pages.page_id
)
```
