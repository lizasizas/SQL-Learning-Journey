WITH CTE AS (
  SELECT
    user_id,
    tweet_date,
    tweet_count,
    COALESCE(LAG(tweet_count) OVER (PARTITION BY user_id ORDER BY tweet_date), 0) AS tweet0,
    COALESCE(LAG(tweet_count, 2) OVER (PARTITION BY user_id ORDER BY tweet_date), 0) AS tweet1
  FROM tweets
)

SELECT
  user_id,
  tweet_date,
  ROUND((tweet_count + COALESCE(tweet0, 0) + COALESCE(tweet1, 0)) * 1.0 / 
    (CASE 
      WHEN tweet0 = 0 AND tweet1 = 0 THEN 1 
      WHEN tweet1 = 0 THEN 2 
      ELSE 3 
    END), 2) AS rolling_avg_3d
FROM CTE;
