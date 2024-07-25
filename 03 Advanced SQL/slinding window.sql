-- SLIDING WINDOW

SELECT 
	m.id, 
  t.team_long_name,
	CASE WHEN m.home_goal > m.away_goal THEN 'MU Win'
		WHEN m.home_goal < m.away_goal THEN 'MU Loss'
    ELSE 'Tie' END AS outcome
FROM match AS m
LEFT JOIN team AS t 
ON m.hometeam_id = t.team_api_id
WHERE 
	season = '2014/2015'
	AND t.team_long_name = 'Manchester United';