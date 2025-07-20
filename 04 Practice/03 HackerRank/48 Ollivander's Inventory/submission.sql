WITH join_table AS (
    SELECT
        w.id, w.code, w.coins_needed, p.age, w.power
    FROM wands w
    LEFT JOIN wands_property p
        ON w.code = p.code
    WHERE p.is_evil = 0
),
final_table AS (
    SELECT id, age, power, coins_needed,
        MIN(coins_needed) OVER (PARTITION BY age, power) AS min_coins
    FROM join_table
)
SELECT id, age, coins_needed, power
FROM final_table
WHERE coins_needed = min_coins
ORDER BY power DESC, age DESC;
