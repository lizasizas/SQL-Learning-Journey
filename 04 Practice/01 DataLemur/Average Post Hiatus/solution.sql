SELECT 
	user_id, 
    MAX(post_date::DATE) - MIN(post_date::DATE) AS days_between
FROM posts
WHERE DATE_PART('year', post_date::DATE) = 2021 
GROUP BY user_id
HAVING COUNT(post_id)>1;

-- or
SELECT 
  user_id,
  EXTRACT(DAY FROM (MAX(post_date) - MIN(post_date))) AS days_between
FROM posts
WHERE post_date BETWEEN '2021-01-01' AND '2021-12-31'
GROUP BY user_id
HAVING COUNT(post_id) > 1;
