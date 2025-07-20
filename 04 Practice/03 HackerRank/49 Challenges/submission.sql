WITH join_table AS (
    SELECT 
        c.hacker_id, h.name,
        COUNT(challenge_id) AS number_of_challenges
    FROM challenges c
    LEFT JOIN hackers h
        ON c.hacker_id = h.hacker_id
    GROUP BY c.hacker_id, h.name
),
frekuensi_challenge AS (
    SELECT number_of_challenges, COUNT(*) AS frekuensi
    FROM join_table 
    GROUP BY number_of_challenges
)
SELECT t.hacker_id, t.name, f.number_of_challenges
FROM join_table t
LEFT JOIN frekuensi_challenge f
    ON t.number_of_challenges = f.number_of_challenges
WHERE f.frekuensi = 1 OR f.number_of_challenges = (SELECT MAX(number_of_challenges) FROM frekuensi_challenge)
ORDER BY f.number_of_challenges DESC, t.hacker_id;
