WITH candidate_skills AS (
  SELECT 
    candidate_id,
    COUNT(skill) AS count_skill
  FROM candidates
  WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
  GROUP BY candidate_id
)

SELECT candidate_id
FROM candidate_skills
WHERE count_skill = 3
ORDER BY candidate_id;
