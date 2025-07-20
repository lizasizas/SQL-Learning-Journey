-- Oracle
WITH CTE AS (
    SELECT lat_n,
        ROW_NUMBER() OVER (ORDER BY lat_n) roww
    FROM station
)
SELECT ROUND(lat_n, 4)
FROM CTE
WHERE roww = (SELECT CEIL(COUNT(*)/2.0) FROM station);

-- MS SQL Server
WITH CTE AS (
    SELECT lat_n,
        ROW_NUMBER() OVER (ORDER BY lat_n) AS roww
    FROM station
)
SELECT CAST(ROUND(lat_n, 4) AS DECIMAL(10,4))
FROM CTE
WHERE roww = (
    SELECT CEILING(1.0 * COUNT(*) / 2.0) FROM station
);
