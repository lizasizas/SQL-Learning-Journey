WITH CTE AS (
  SELECT
    COUNT (item_id) FILTER (WHERE item_type = 'prime_eligible') AS prime_eligible_count,
    COUNT (item_id) FILTER (WHERE item_type = 'not_prime') AS not_prime_count,
    SUM (square_footage) FILTER (WHERE item_type = 'prime_eligible') AS prime_eligible_sum,
    SUM (square_footage) FILTER (WHERE item_type = 'not_prime') AS not_prime_sum
  FROM inventory
),
prime_eligible AS (
  SELECT 
    'prime_eligible' AS item_type,
    FLOOR(500000/prime_eligible_sum)*prime_eligible_count AS item_count
  FROM CTE
),
not_prime AS (
  SELECT 
    'not_prime' AS item_type,
    FLOOR((500000-FLOOR(500000/prime_eligible_sum)*prime_eligible_sum)/not_prime_sum)*not_prime_count 
      AS item_count
  FROM CTE
)
SELECT * FROM prime_eligible
UNION ALL
SELECT * FROM not_prime;
