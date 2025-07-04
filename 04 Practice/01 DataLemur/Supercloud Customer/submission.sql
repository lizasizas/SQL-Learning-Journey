WITH CTE AS (
  SELECT
    DISTINCT c.customer_id,
    COUNT(DISTINCT p.product_category) AS sum_category
  FROM customer_contracts AS c
  INNER JOIN products AS p
    ON c.product_id = p.product_id
  GROUP BY c.customer_id
)

SELECT customer_id
FROM CTE
WHERE sum_category = (SELECT COUNT(DISTINCT product_category) FROM products);
