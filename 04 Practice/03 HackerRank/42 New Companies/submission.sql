WITH lead_manager_count AS (
    SELECT company_code, COUNT(DISTINCT lead_manager_code) AS count_lead_manager
    FROM lead_manager
    GROUP BY company_code
),
senior_manager_count AS (
    SELECT company_code, COUNT(DISTINCT senior_manager_code) AS count_senior_manager
    FROM senior_manager
    GROUP BY company_code
),
manager_count AS (
    SELECT company_code, COUNT(DISTINCT manager_code) AS count_manager
    FROM manager
    GROUP BY company_code
),
employee_count AS (
    SELECT company_code, COUNT(DISTINCT employee_code) AS count_employee
    FROM employee
    GROUP BY company_code
)
SELECT 
    c.company_code,
    c.founder,
    l.count_lead_manager,
    s.count_senior_manager,
    m.count_manager,
    e.count_employee
FROM company c
LEFT JOIN lead_manager_count l ON c.company_code = l.company_code
LEFT JOIN senior_manager_count s ON c.company_code = s.company_code
LEFT JOIN manager_count m ON c.company_code = m.company_code
LEFT JOIN employee_count e ON c.company_code = e.company_code
ORDER BY c.company_code;
