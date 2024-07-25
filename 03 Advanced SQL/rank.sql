-- RANK

SELECT  
  date,  
  (home_goal+away_goal) AS goals,  
  RANK() OVER(ORDER BY home_goal+away_goal) AS goals_rank 
FROM match
WHERE season = '2011/2012';