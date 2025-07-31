WITH name_table AS (
    SELECT s.id, s.name, f.friend_id, p.salary
    FROM students s
    LEFT JOIN friends f ON s.id = f.id
    LEFT JOIN packages p ON s.id = p.id
),
friends_salary AS (
    SELECT n.id, n.name, n.salary, n.friend_id, p.salary AS friend_salary
    FROM name_table n
    LEFT JOIN packages p ON n.friend_id = p.id
)
SELECT name
FROM friends_salary
WHERE friend_salary > salary
ORDER BY friend_salary;
