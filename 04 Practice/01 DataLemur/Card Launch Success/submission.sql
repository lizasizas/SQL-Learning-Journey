WITH CTE AS (
  SELECT 
    card_name,
    issued_amount,
    CONCAT(issue_month, '/', '1', '/', issue_year)::DATE AS datee
  FROM monthly_cards_issued
),

rank_date AS (
  SELECT card_name, issued_amount,
    ROW_NUMBER() OVER (PARTITION BY card_name ORDER BY datee) AS row_numberr 
  FROM CTE
)

SELECT
  DISTINCT card_name,
  issued_amount
FROM rank_date
WHERE row_numberr = 1
ORDER BY issued_amount DESC;
