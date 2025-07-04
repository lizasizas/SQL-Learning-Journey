WITH highest AS (
  SELECT DISTINCT ON (ticker)
    ticker,
    month_year AS highest_mth,
    MAX(open) OVER (PARTITION BY ticker) AS highest_open
  FROM (SELECT ticker, open, TO_CHAR(date, 'Mon-YYYY') AS month_year FROM stock_prices) AS table1
  ORDER BY ticker, open DESC
),
lowest AS (
  SELECT DISTINCT ON (ticker)
    ticker,
    month_year AS lowest_mth,
    MIN(open) OVER (PARTITION BY ticker) AS lowest_open
  FROM (SELECT ticker, open, TO_CHAR(date, 'Mon-YYYY') AS month_year FROM stock_prices) AS table2
  ORDER BY ticker, open ASC
)

SELECT
  DISTINCT h.ticker,
  highest_mth,
  highest_open,
  lowest_mth,
  lowest_open
FROM highest AS h
INNER JOIN lowest AS l
  ON h.ticker = l.ticker
ORDER BY h.ticker;
