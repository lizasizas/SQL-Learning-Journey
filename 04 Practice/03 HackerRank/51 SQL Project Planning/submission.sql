WITH consecutive_dates AS (
    SELECT 
        *, 
        DATEADD(DAY, -ROW_NUMBER() OVER (ORDER BY start_date), start_date) AS group_date
    FROM Projects
), 
final_table AS (
    SELECT 
        MIN(start_date) AS project_start,
        MAX(end_date) AS project_end,
        DATEDIFF(DAY, MIN(start_date), MAX(end_date)) AS project_days
    FROM consecutive_dates
    GROUP BY group_date
)
SELECT project_start, project_end
FROM final_table
ORDER BY project_days ASC, project_start;
