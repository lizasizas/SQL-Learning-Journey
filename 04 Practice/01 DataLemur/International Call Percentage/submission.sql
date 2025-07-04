WITH caller AS (
  SELECT 
    pc.caller_id,
    pc.receiver_id,
    pi.country_id AS caller_country
  FROM phone_calls AS pc
  INNER JOIN phone_info AS pi 
    ON pc.caller_id = pi.caller_id
),
receiver AS (
  SELECT 
    pc.caller_id,
    pc.receiver_id,
    pi.country_id AS receiver_country
  FROM phone_calls AS pc
  INNER JOIN phone_info AS pi 
    ON pc.receiver_id = pi.caller_id 
)
SELECT 
  ROUND((100.0 *
    SUM(CASE WHEN caller_country != receiver_country THEN 1 ELSE 0 END)
    / COUNT(caller_country)), 1) AS international_calls_pct
FROM caller c 
INNER JOIN receiver r
  ON c.caller_id = r.caller_id AND c.receiver_id = r.receiver_id; 
