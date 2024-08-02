SELECT
  manufacturer,
  COUNT(DISTINCT drug) AS drug_count,
  ABS(SUM(total_sales) - SUM(cogs)) AS total_loss
FROM pharmacy_sales
WHERE total_sales - cogs <= 0 
GROUP BY manufacturer
ORDER BY total_loss DESC;
