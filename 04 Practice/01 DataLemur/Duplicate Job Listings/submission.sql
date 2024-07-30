WITH CTE AS (
  SELECT 
    company_id,
    COUNT(DISTINCT title) AS distinct_count_job,
    COUNT(title) AS count_job
  FROM job_listings
  GROUP BY company_id
)

SELECT COUNT(company_id)
FROM CTE 
WHERE distinct_count_job <> count_job
