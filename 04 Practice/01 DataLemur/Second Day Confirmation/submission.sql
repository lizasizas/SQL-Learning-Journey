WITH CTE AS (
  SELECT
    user_id,
    SUM(CASE WHEN signup_action = 'Not confirmed' THEN 1 ELSE 0 END) AS email_nc,
    SUM(CASE WHEN signup_action = 'Confirmed' THEN 1 ELSE 0 END) AS email_c
  FROM emails AS e
  FULL JOIN texts AS t ON e.email_id=t.email_id
  GROUP BY user_id
  )

SELECT user_id
FROM CTE
WHERE email_nc = 1 AND email_c = 1;
