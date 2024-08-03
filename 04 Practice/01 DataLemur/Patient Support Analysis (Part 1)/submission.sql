WITH CTE AS (
  SELECT
    policy_holder_id,
    COUNT(case_id) AS count_call
  FROM callers
  GROUP BY policy_holder_id
)

SELECT 
  COUNT(policy_holder_id) AS policy_holder_count
FROM CTE 
WHERE count_call >= 3;
