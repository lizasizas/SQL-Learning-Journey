WITH CTE AS (
  SELECT
    category,
    product,
    SUM(spend) AS total_spend,
    RANK() OVER (PARTITION BY category ORDER BY SUM(spend) DESC) AS row_rank
  FROM product_spend
  WHERE DATE_PART('year', transaction_date::DATE) = 2022
  GROUP BY product, category
  ORDER BY category
  )

SELECT 
  category,
  product,
  total_spend
FROM CTE
WHERE row_rank IN (1, 2);
