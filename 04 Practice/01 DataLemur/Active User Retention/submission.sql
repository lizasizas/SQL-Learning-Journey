WITH juni AS (
  SELECT user_id AS user_id_juni, event_type,
    DATE_PART('month', event_date) AS part_month
  FROM user_actions
  WHERE DATE_PART('month', event_date) = 6
),

july AS (
  SELECT user_id AS user_id_july, event_type,
    DATE_PART('month', event_date) AS part_month
  FROM user_actions
  WHERE DATE_PART('month', event_date) = 7
)

SELECT
  part_month AS month,
  COUNT(DISTINCT user_id_july) AS monthly_active_users
FROM july
WHERE user_id_july IN (SELECT user_id_juni FROM juni)
GROUP BY part_month;
