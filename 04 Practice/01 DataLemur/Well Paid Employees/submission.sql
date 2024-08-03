WITH CTE AS (
  SELECT
    employee_id AS manager_id,
    name AS manager_name,
    salary AS manager_salary
  FROM employee
  WHERE manager_id IS NULL
)

SELECT
  employee.employee_id,
  employee.name AS employee_name
FROM CTE
INNER JOIN employee
  ON CTE.manager_id = employee.manager_id
WHERE (employee.salary > CTE.manager_salary);
