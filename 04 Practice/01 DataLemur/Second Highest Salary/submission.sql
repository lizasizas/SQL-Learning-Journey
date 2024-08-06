WITH CTE AS (
  SELECT
    employee_id,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS rank_salary
  FROM employee
)

SELECT salary AS second_highest_salary
FROM CTE
WHERE rank_salary = 2;
