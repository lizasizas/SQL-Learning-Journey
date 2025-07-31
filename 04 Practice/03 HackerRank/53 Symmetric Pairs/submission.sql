WITH symmetric_pairs AS ( 
    SELECT f1.x, f1.y, f2.y AS ax, f2.x AS ay
    FROM functions f1 
    JOIN functions f2 
        ON f1.x = f2.y AND f1.y = f2.x 
), 
final_table AS (
    SELECT DISTINCT x, y 
    FROM symmetric_pairs 
    WHERE x < y
    UNION
    SELECT x, y 
    FROM functions 
    WHERE x = y 
    GROUP BY x, y 
    HAVING COUNT(*) > 1
)
SELECT x, y 
FROM final_table
ORDER BY x, y;
