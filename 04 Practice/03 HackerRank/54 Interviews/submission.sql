WITH new_submission_stats AS (
    SELECT 
        s.challenge_id, s.total_submissions, s.total_accepted_submissions, 
        c.college_id, o.contest_id, h.hacker_id, h.name
    FROM submission_stats s
    LEFT JOIN challenges c ON s.challenge_id = c.challenge_id
    LEFT JOIN colleges o ON c.college_id = o.college_id
    LEFT JOIN contests h ON o.contest_id = h.contest_id
),
new_view_stats AS (
    SELECT 
        v.challenge_id, v.total_views, v.total_unique_views, c.college_id, o.contest_id,
        h.hacker_id, h.name
    FROM view_stats v
    LEFT JOIN challenges c ON v.challenge_id = c.challenge_id
    LEFT JOIN colleges o ON c.college_id = o.college_id
    LEFT JOIN contests h ON o.contest_id = h.contest_id
),
sum_submission_stats AS (
    SELECT 
        DISTINCT contest_id, hacker_id, name,
        SUM(total_submissions) OVER (PARTITION BY contest_id) AS sum_s,
        SUM(total_accepted_submissions) OVER (PARTITION BY contest_id) AS sum_as
    FROM new_submission_stats
),
sum_view_stats AS (
    SELECT 
        DISTINCT contest_id, hacker_id, name,
        SUM(total_views) OVER (PARTITION BY contest_id) AS sum_v,
        SUM(total_unique_views) OVER (PARTITION BY contest_id) AS sum_uv
    FROM new_view_stats
),
final_table AS (
    SELECT ss.contest_id, ss.hacker_id, ss.name, ss.sum_s, ss.sum_as, vs.sum_v, vs.sum_uv
    FROM sum_submission_stats ss
    LEFT JOIN sum_view_stats vs ON ss.contest_id = vs.contest_id
)
SELECT *
FROM final_table
WHERE sum_s IS NOT NULL AND sum_as IS NOT NULL AND sum_v IS NOT NULL AND sum_uv IS NOT NULL
ORDER BY contest_id;
