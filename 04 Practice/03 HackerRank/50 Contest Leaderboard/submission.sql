WITH first_table AS (
    SELECT 
        DISTINCT 
            s.hacker_id, h.name, s.challenge_id, 
        MAX(score) OVER (PARTITION BY s.challenge_id, s.hacker_id) AS max_score_challenge
    FROM submissions s
    LEFT JOIN hackers h ON s.hacker_id = h.hacker_id
),
final_table AS (
    SELECT 
        DISTINCT hacker_id,
        name,
        SUM(max_score_challenge) OVER (PARTITION BY hacker_id) AS sum_scores
    FROM first_table
)
SELECT *
FROM final_table
WHERE sum_scores != 0
ORDER BY sum_scores DESC, hacker_id;
