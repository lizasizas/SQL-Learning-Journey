WITH CTE AS (
  SELECT
    e.employee_id,
    COALESCE(COUNT(DISTINCT query_id), 0) AS unique_queries
  FROM employees AS 
  LEFT JOIN queries AS q ON q.employee_id=e.employee_id
    AND q.query_starttime BETWEEN '2023-07-01' AND '2023-10-01'
  GROUP BY e.employee_id
)

SELECT 
  unique_queries,
  COUNT(employee_id) AS employee_count
FROM CTE
GROUP BY unique_queries
ORDER BY unique_queries;
