WITH Country_Awards AS (
  SELECT
    Country,
    Year,
    COUNT(*) AS Awards
  FROM Summer_Medals
  WHERE
    Country IN ('FRA', 'GBR', 'GER')
    AND Year IN (2004, 2008, 2012)
    AND Medal = 'Gold'
  GROUP BY Country, Year)

SELECT
  Country,
  Year,
  RANK() OVER(PARTITION BY Year ORDER BY Awards DESC) :: INTEGER AS rank
FROM Country_Awards
ORDER BY Country ASC, Year ASC;