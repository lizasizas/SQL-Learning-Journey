WITH CTE AS (
    SELECT e.*, TO_NUMBER(NULLIF(REPLACE(TO_CHAR(salary), '0'), '')) AS without_zero
    FROM employees e
)
SELECT CEIL(AVG(salary) - AVG(without_zero))
FROM CTE;
