WITH CTE AS (
    SELECT 
        s.submission_id, s.hacker_id, s.challenge_id, s.score, h.name, 
        c.difficulty_level, d.score AS max_score
    FROM submissions s
    LEFT JOIN hackers h ON s.hacker_id = h.hacker_id
    LEFT JOIN challenges c ON s.challenge_id = c.challenge_id
    LEFT JOIN difficulty d ON c.difficulty_level = d.difficulty_level
), 
final_table AS (
    SELECT 
        DISTINCT hacker_id, name,
        SUM (CASE WHEN score = max_score THEN 1 ELSE 0 END) OVER (PARTITION BY hacker_id) AS full_score_count
    FROM CTE
)
SELECT hacker_id, name 
FROM final_table
WHERE full_score_count > 1
ORDER BY full_score_count DESC, hacker_id;
