SELECT
  drug,
  (total_sales - cogs) AS total_ptofit
FROM pharmacy_sales
ORDER BY total_ptofit DESC
LIMIT 3;
