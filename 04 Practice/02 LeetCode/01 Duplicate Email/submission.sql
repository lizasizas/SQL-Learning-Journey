# Write your MySQL query statement below
WITH CTE AS (
    SELECT 
        DISTINCT email, 
        count(email) AS count
    FROM Person
    GROUP BY email)

SELECT email
FROM CTE
WHERE count > 1;
