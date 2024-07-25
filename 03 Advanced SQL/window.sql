-- window function

SELECT
  date,
  (home_goal+away_goal) AS goals,
  AVG(home_goal+away_goal) OVER() AS overl_avg
FROM match
WHERE season = '2011/2012';