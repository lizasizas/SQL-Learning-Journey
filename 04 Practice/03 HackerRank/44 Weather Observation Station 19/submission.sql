WITH CTE AS (
    SELECT 
        MIN(lat_n) AS a,
        MAX(lat_n) AS b,
        MIN(long_w) AS c,
        MAX(long_w) AS d
    FROM station
)
SELECT CAST( ROUND( SQRT( POWER(a-b, 2) + POWER(c-d, 2) ), 4) AS DECIMAL(10,4))
FROM CTE;
