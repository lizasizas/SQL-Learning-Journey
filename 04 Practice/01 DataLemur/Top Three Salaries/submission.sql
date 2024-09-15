WITH CTE AS (
  SELECT
    d.department_name,
    e.name,
    e.salary,
    DENSE_RANK() OVER (
      PARTITION BY d.department_name
      ORDER BY e.salary DESC) AS rank_salary
  FROM employee AS e
  FULL JOIN department AS d
    ON e.department_id = d.department_id
  )

SELECT 
  department_name,
  name,
  salary
FROM CTE
WHERE rank_salary <= 3;
