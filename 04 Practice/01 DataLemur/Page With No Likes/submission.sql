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
