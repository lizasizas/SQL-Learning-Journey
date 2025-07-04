WITH CTE AS (
  SELECT 
    card_name,
    issued_amount,
    CONCAT(issue_month, '/', '1', '/', issue_year)::DATE AS issue_date,
    MIN(CONCAT(issue_month, '/', '1', '/', issue_year)::DATE) 
      OVER (PARTITION BY card_name) AS launch_date
  FROM monthly_cards_issued
)

SELECT
  DISTINCT card_name,
  issued_amount
FROM CTE
WHERE issue_date = launch_date
ORDER BY issued_amount DESC;
