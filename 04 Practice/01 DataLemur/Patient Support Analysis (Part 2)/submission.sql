SELECT 
  ROUND(100.0 * 
    COUNT(*) FILTER (WHERE call_category LIKE 'n/a' OR call_category ISNULL)
    / COUNT(*), 1) AS uncategorised_call_pct
FROM callers;
