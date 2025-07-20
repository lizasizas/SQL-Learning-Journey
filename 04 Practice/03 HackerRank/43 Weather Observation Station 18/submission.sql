WITH CTE AS (
    SELECT 
        MIN(lat_n) AS a,
        MIN(long_w) AS b,
        MAX(lat_n) AS c,
        MAX(long_w) As d
    FROM station
)
SELECT CAST(ROUND(ABS(a-c)+ABS(b-d), 4) AS DECIMAL(10,4))
FROM CTE;
