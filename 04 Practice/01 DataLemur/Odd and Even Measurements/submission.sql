WITH CTE AS (
  SELECT
    *,
    ROW_NUMBER() OVER (PARTITION BY timee ORDER BY timee) AS numberr
  FROM
    (SELECT measurement_time::DATE AS timee, measurement_value 
    FROM measurements
    ORDER BY measurement_time
    ) AS new_table
)

SELECT 
  DISTINCT timee AS measurement_day,
  SUM (CASE WHEN numberr % 2 != 0 THEN measurement_value ELSE 0 END) AS odd_sum,
  SUM (CASE WHEN numberr % 2 = 0 THEN measurement_value ELSE 0 END) AS even_sum
FROM CTE
GROUP BY timee
ORDER BY timee;
