WITH CTE AS (
    SELECT name, marks,
        CASE WHEN marks BETWEEN 0 AND 9 THEN 1 
            WHEN marks BETWEEN 10 AND 19 THEN 2
            WHEN marks BETWEEN 20 AND 29 THEN 3
            WHEN marks BETWEEN 30 AND 39 THEN 4
            WHEN marks BETWEEN 40 AND 49 THEN 5
            WHEN marks BETWEEN 50 AND 59 THEN 6
            WHEN marks BETWEEN 60 AND 69 THEN 7
            WHEN marks BETWEEN 70 AND 79 THEN 8
            WHEN marks BETWEEN 80 AND 89 THEN 9
            WHEN marks BETWEEN 90 AND 100 THEN 10 END AS grade
    FROM students
)
SELECT 
    CASE WHEN grade > 7 THEN name ELSE NULL END AS name,
    grade, marks
FROM CTE
ORDER BY grade DESC, name;
