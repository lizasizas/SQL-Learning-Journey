-- Start coding here...
SELECT 
	stay, 
	COUNT(*) AS count_int, 
	ROUND(AVG(todep), 2) AS average_phq, 
	ROUND(AVG(tosc), 2) AS average_scs, 
	ROUND(AVG(toas), 2) AS average_as
FROM students
WHERE stay IS NOT NULL AND Inter_dom = 'Inter'
GROUP BY stay
ORDER BY stay DESC
LIMIT 9;
