-- PARTITION

SELECT 
   date, 
   (home_goal+away_goal) AS goals, 
   AVG(home_goal+away_goal) OVER(PARTITION BY season) AS season_avg 
FROM match


SELECT
   c.name,
   m.season,
   (home_goal + away_goal) AS goals,
   AVG(home_goal + away_goal)
      OVER(PARTITION BY m.season, c.name) AS season_ctry_avg
FROM country AS c
LEFT JOIN match AS m
ON c.id = m.country_id
