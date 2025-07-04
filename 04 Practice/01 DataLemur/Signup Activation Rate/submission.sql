SELECT
  ROUND(1.0 * SUM(CASE WHEN signup_action = 'Confirmed' THEN 1 ELSE 0 END)
    / COUNT (e.email_id), 2) AS confirm_rate
FROM emails AS e
JOIN texts AS t
  ON e.email_id = t.email_id;
