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
