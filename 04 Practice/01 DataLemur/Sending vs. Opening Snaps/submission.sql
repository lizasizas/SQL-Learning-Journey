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
